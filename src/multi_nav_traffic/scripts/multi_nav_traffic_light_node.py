#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Multi-point navigation with traffic light detection node.

Features:
  1. Collect waypoints via RViz "Publish Point" tool (/clicked_point)
  2. Navigate sequentially through waypoints using move_base action API
  3. YOLO + LiDAR fusion for traffic light detection (red/green/yellow)
  4. Red light: gradual deceleration → stop at hold distance → wait green → resume
  5. Gamma correction for outdoor bright light environments

Verified-project improvements applied:
  - State debouncing (CarND-Capstone): require N consecutive frames before state change
  - Confidence threshold (ROS2 traffic robot): filter low-confidence YOLO detections
  - Gradual proportional deceleration (CarND waypoint_updater): smooth speed ramp
  - Distance EMA filter: reduce LiDAR jitter
  - Safety margin: stop slightly before hold_distance (CarND pattern)
  - Temporal filtering: stabilize decision outputs over time (ROS2 traffic robot)
  - Performance: skip YOLO when not navigating

Usage:
  roslaunch multi_nav_traffic multi_nav.launch
  # In RViz: use "Publish Point" tool to click waypoints on the map
  # Then: rosservice call /start_multi_nav

Author: 蔡博涵
"""

import os
import rospy
import tf
import math
import time
import numpy as np
import cv2
import actionlib
import collections

from sensor_msgs.msg import LaserScan, Image
from std_msgs.msg import String, Float32, ColorRGBA
from geometry_msgs.msg import PointStamped, Twist
from visualization_msgs.msg import Marker, MarkerArray
from std_srvs.srv import Trigger, TriggerResponse
from cv_bridge import CvBridge
from move_base_msgs.msg import MoveBaseAction, MoveBaseGoal

from ultralytics import YOLO


# ============================================================
#  Gamma correction utility
# ============================================================
def build_gamma_table(gamma):
    """gamma > 1 darkens image (outdoor bright light), gamma < 1 brightens."""
    if abs(gamma - 1.0) < 1e-6:
        return None
    inv_gamma = 1.0 / gamma
    return np.array([(i / 255.0) ** inv_gamma * 255
                     for i in range(256)]).astype("uint8")


# ============================================================
#  Main node class
# ============================================================
class MultiNavTrafficLightNode:
    """Multi-point navigation with traffic light detection and stop control."""

    # --- Navigation state machine ---
    IDLE = "IDLE"
    COLLECTING = "COLLECTING"
    NAVIGATING = "NAVIGATING"
    STOPPING_FOR_RED = "STOPPING_FOR_RED"
    WAITING_GREEN = "WAITING_GREEN"
    DONE = "DONE"

    # --- YOLO class mapping (adjust to match your trained model) ---
    CLASS_NAMES = {0: "green", 1: "red", 2: "yellow"}

    # --- OpenCV -> ROS coordinate rotation ---
    R_CV_TO_ROS = np.array([[0, 0, 1],
                            [-1, 0, 0],
                            [0, -1, 0]], dtype=np.float64)

    def __init__(self):
        rospy.init_node("multi_nav_traffic_light_node")

        # ---- ROS parameters ----
        self.model_path         = rospy.get_param("~model_path",          "best_new.pt")
        self.gamma              = rospy.get_param("~gamma",               1.5)
        self.camera_frame       = rospy.get_param("~camera_frame",        "camera_link")
        self.laser_frame        = rospy.get_param("~laser_frame",         "laser")
        self.robot_frame        = rospy.get_param("~robot_frame",         "base_footprint")
        self.stop_distance      = rospy.get_param("~stop_distance",       3.0)
        self.hold_distance      = rospy.get_param("~hold_distance",       1.5)
        self.angle_tolerance    = math.radians(rospy.get_param("~angle_tolerance", 2.0))
        self.green_confirm_n    = rospy.get_param("~green_confirm_frames", 5)
        self.red_wait_timeout   = rospy.get_param("~red_wait_timeout",    30.0)

        # ---- Improved: confidence & debounce params (from verified projects) ----
        self.conf_threshold     = rospy.get_param("~confidence_threshold",  0.5)
        self.red_debounce_n     = rospy.get_param("~red_debounce_frames",   3)
        self.dist_filter_window = rospy.get_param("~distance_filter_window", 5)
        self.max_approach_vel   = rospy.get_param("~max_approach_vel",      0.3)
        self.creep_vel          = rospy.get_param("~creep_vel",             0.05)
        self.safety_margin      = rospy.get_param("~safety_margin",         0.2)
        self.use_mock_detection = rospy.get_param("~use_mock_detection",   False)
        self.show_window        = rospy.get_param("~show_detection_window", True)

        self.fx = rospy.get_param("~fx", 400.0)
        self.fy = rospy.get_param("~fy", 400.0)
        self.cx = rospy.get_param("~cx", 320.0)
        self.cy = rospy.get_param("~cy", 240.0)

        # ---- Gamma lookup table ----
        self.gamma_table = build_gamma_table(self.gamma)

        # ---- TF ----
        self.tf_listener = tf.TransformListener()

        # ---- YOLO model ----
        rospy.loginfo("Loading YOLO model: %s", self.model_path)
        self.model = YOLO(self.model_path)
        self.bridge = CvBridge()

        # ---- Detection state (updated by callbacks, read by state machine) ----
        self.detected_class  = None          # "red" / "green" / "yellow" / None
        self.target_angle    = None          # angle to traffic light in robot frame (rad)
        self.light_distance  = float("inf")  # LiDAR-measured distance (m)
        self.latest_frame    = None

        # ---- Improved: EMA distance filter ----
        self._dist_buffer = collections.deque(maxlen=self.dist_filter_window)
        self._dist_filtered = float("inf")

        # ---- Improved: red entry debounce counter ----
        self._red_entry_count = 0

        # ---- Waypoint state ----
        self.waypoints       = []   # list of (x, y) in map frame
        self.current_wp_idx  = 0
        self.state           = self.IDLE

        # ---- move_base action client ----
        self.move_base_client = actionlib.SimpleActionClient("move_base", MoveBaseAction)
        rospy.loginfo("Waiting for move_base action server ...")
        if not self.move_base_client.wait_for_server(rospy.Duration(10.0)):
            rospy.logerr("move_base action server not available after 10s")
        else:
            rospy.loginfo("move_base action server connected.")

        # ---- Red-light handling state ----
        self.green_count        = 0
        self.red_wait_start     = None
        self.goal_cancelled     = False   # Improved: track whether move_base goal was cancelled

        # ---- Subscribers ----
        rospy.Subscriber("/clicked_point",      PointStamped, self.cb_clicked_point)
        rospy.Subscriber("/usb_cam/image_raw",  Image,        self.cb_image)
        rospy.Subscriber("/scan",               LaserScan,    self.cb_scan)

        # ---- Mock detection subscribers (simulation) ----
        if self.use_mock_detection:
            rospy.Subscriber("/mock_traffic_light_status",  String,  self.cb_mock_status)
            rospy.Subscriber("/mock_traffic_light_distance", Float32, self.cb_mock_distance)
            rospy.loginfo("Using MOCK traffic light detection (bypassing YOLO)")

        # ---- Publishers ----
        self.pub_status   = rospy.Publisher("/traffic_light_status",   String,  queue_size=10)
        self.pub_distance = rospy.Publisher("/traffic_light_distance", Float32, queue_size=10)
        self.pub_nav      = rospy.Publisher("/nav_state",             String,  queue_size=10)
        self.pub_cmd_vel  = rospy.Publisher("/cmd_vel",               Twist,   queue_size=10)
        self.pub_waypoints = rospy.Publisher("/waypoint_markers", MarkerArray, queue_size=1)

        # ---- Services ----
        rospy.Service("/start_multi_nav",  Trigger, self.srv_start_nav)
        rospy.Service("/clear_waypoints",  Trigger, self.srv_clear_waypoints)

        # ---- State machine timer (10 Hz) ----
        rospy.Timer(rospy.Duration(0.1), self.cb_state_machine)

        rospy.loginfo("MultiNavTrafficLight ready. | gamma=%.1f conf=%.2f "
                      "stop=%.1fm hold=%.1fm+%.2f margin "
                      "debounce=%d green_confirm=%d timeout=%.1fs",
                      self.gamma, self.conf_threshold,
                      self.stop_distance, self.hold_distance, self.safety_margin,
                      self.red_debounce_n, self.green_confirm_n, self.red_wait_timeout)

    # ================================================================
    #  Gamma correction
    # ================================================================
    def apply_gamma(self, img):
        """Apply gamma correction via LUT (fast)."""
        if self.gamma_table is not None:
            return cv2.LUT(img, self.gamma_table)
        return img

    # ================================================================
    #  Waypoint collection callback
    # ================================================================
    def cb_clicked_point(self, msg):
        """Receive point from RViz Publish Point tool."""
        if self.state == self.IDLE:
            self.state = self.COLLECTING
            rospy.loginfo("Entering COLLECTING state (first waypoint received)")

        if self.state == self.COLLECTING:
            x, y = msg.point.x, msg.point.y
            self.waypoints.append((x, y))
            rospy.loginfo("  [WP %d]  (%.2f,  %.2f)", len(self.waypoints), x, y)
            self._publish_waypoint_markers()

    # ================================================================
    #  Service callbacks
    # ================================================================
    def srv_start_nav(self, _req):
        """Trigger multi-point navigation."""
        if not self.waypoints:
            rospy.logwarn("No waypoints collected. Use RViz Publish Point first.")
            return TriggerResponse(success=False, message="No waypoints")
        self.current_wp_idx = 0
        self.state = self.NAVIGATING
        self.goal_cancelled = False
        rospy.loginfo("=== Multi-nav START: %d waypoints ===", len(self.waypoints))
        self._send_waypoint_goal()  # 立即发第一个点，防止旧 SUCCEEDED 状态被误判
        return TriggerResponse(success=True, message="Nav started")

    def srv_clear_waypoints(self, _req):
        """Clear all waypoints and cancel navigation."""
        self.move_base_client.cancel_all_goals()
        self.waypoints = []
        self.current_wp_idx = 0
        self.state = self.IDLE
        self.green_count = 0
        self._red_entry_count = 0
        self.goal_cancelled = False
        self._hold_robot()
        self._publish_waypoint_markers(clear=True)
        rospy.loginfo("Waypoints cleared. State -> IDLE")
        return TriggerResponse(success=True, message="Cleared")

    # ================================================================
    #  Waypoint visualization markers
    # ================================================================
    def _publish_waypoint_markers(self, clear=False):
        """Publish MarkerArray so RViz shows all collected waypoints."""
        markers = MarkerArray()
        if not clear:
            for i, (x, y) in enumerate(self.waypoints):
                m = Marker()
                m.header.frame_id = "map"
                m.header.stamp = rospy.Time.now()
                m.ns = "waypoints"
                m.id = i
                m.type = Marker.SPHERE
                m.action = Marker.ADD
                m.pose.position.x = x
                m.pose.position.y = y
                m.pose.position.z = 0.05
                m.scale.x = 0.15
                m.scale.y = 0.15
                m.scale.z = 0.15
                m.color.r = 0.0
                m.color.g = 1.0
                m.color.b = 0.0
                m.color.a = 0.8
                m.lifetime = rospy.Duration(0)  # permanent
                markers.markers.append(m)

                # Label text
                t = Marker()
                t.header.frame_id = "map"
                t.header.stamp = rospy.Time.now()
                t.ns = "waypoint_labels"
                t.id = i + 1000
                t.type = Marker.TEXT_VIEW_FACING
                t.action = Marker.ADD
                t.pose.position.x = x
                t.pose.position.y = y
                t.pose.position.z = 0.3
                t.scale.z = 0.2
                t.text = str(i + 1)
                t.color.r = 1.0
                t.color.g = 1.0
                t.color.b = 1.0
                t.color.a = 1.0
                t.lifetime = rospy.Duration(0)
                markers.markers.append(t)
        # Delete old markers on clear
        else:
            m = Marker()
            m.header.frame_id = "map"
            m.ns = "waypoints"
            m.action = Marker.DELETEALL
            markers.markers.append(m)
            m = Marker()
            m.header.frame_id = "map"
            m.ns = "waypoint_labels"
            m.action = Marker.DELETEALL
            markers.markers.append(m)

        self.pub_waypoints.publish(markers)

    # ================================================================
    #  YOLO image callback
    #  Improved: confidence filtering + performance skip
    # ================================================================
    def cb_image(self, msg):
        """YOLO detection with gamma correction and confidence filtering."""
        # ---- Performance: skip YOLO when not actively navigating ----
        if self.state not in (self.NAVIGATING, self.STOPPING_FOR_RED, self.WAITING_GREEN):
            return

        try:
            frame = self.bridge.imgmsg_to_cv2(msg, "bgr8")
        except Exception as e:
            rospy.logwarn("cv_bridge error: %s", e)
            return

        # Gamma correction + YOLO inference
        processed = self.apply_gamma(frame)
        results = self.model(processed, verbose=False)

        best_target = None
        min_dist = float("inf")

        for box in results[0].boxes:
            cls = int(box.cls[0])
            if cls > 2:
                continue

            # ---- Improved: confidence filtering ----
            conf = float(box.conf[0]) if hasattr(box, 'conf') and len(box.conf) > 0 else 1.0
            if conf < self.conf_threshold:
                continue

            x1, y1, x2, y2 = box.xyxy[0].cpu().numpy()
            u = (x1 + x2) / 2.0
            v = (y1 + y2) / 2.0

            d = math.sqrt((u - self.cx) ** 2 + (v - self.cy) ** 2)
            if d < min_dist:
                min_dist = d
                best_target = {
                    "u": u, "v": v, "cls": cls, "conf": conf,
                    "bbox": (int(x1), int(y1), int(x2), int(y2))
                }

        if best_target:
            u, v, cls, conf, bbox = (best_target[k] for k in ("u", "v", "cls", "conf", "bbox"))
            self.detected_class = self.CLASS_NAMES.get(cls, None)

            # Pixel -> camera normalized coords -> ROS coords
            x_norm = (u - self.cx) / self.fx
            y_norm = (v - self.cy) / self.fy
            p_cam  = self.R_CV_TO_ROS @ np.array([x_norm, y_norm, 1.0])

            pt = PointStamped()
            pt.header.frame_id = self.camera_frame
            pt.header.stamp    = msg.header.stamp  # 以摄像头时间戳为准
            pt.point.x = p_cam[0]
            pt.point.y = p_cam[1]
            pt.point.z = p_cam[2]

            try:
                self.tf_listener.waitForTransform(
                    self.robot_frame, self.camera_frame,
                    msg.header.stamp, rospy.Duration(0.1))
                pt_base = self.tf_listener.transformPoint(self.robot_frame, pt)
                self.target_angle = math.atan2(pt_base.point.y, pt_base.point.x)

                # Draw detection overlay
                color = (0, 0, 255) if self.detected_class == "red" else (0, 255, 0)
                cv2.rectangle(frame, (bbox[0], bbox[1]), (bbox[2], bbox[3]), color, 2)
                label = "%s %.2f a=%.1f" % (self.detected_class, conf, math.degrees(self.target_angle))
                cv2.putText(frame, label, (bbox[0], bbox[1] - 10),
                            cv2.FONT_HERSHEY_SIMPLEX, 0.6, color, 2)
            except (tf.LookupException, tf.ConnectivityException,
                    tf.ExtrapolationException):
                self.target_angle   = None
                self.detected_class = None
        else:
            self.detected_class = None
            self.target_angle   = None

        # Status overlay
        dist_str = "%.2f m" % self._dist_filtered if self._dist_filtered != float("inf") else "-- m"
        info_lines = [
            "Gamma: %.1f | Conf: %.2f" % (self.gamma, self.conf_threshold),
            "Detect: %s" % (self.detected_class or "none"),
            "Dist: %s  | State: %s" % (dist_str, self.state),
        ]
        for i, txt in enumerate(info_lines):
            cv2.putText(frame, txt, (10, 30 + i * 25),
                        cv2.FONT_HERSHEY_SIMPLEX, 0.65, (255, 255, 0), 2)

        self.latest_frame = frame.copy()
        self.pub_status.publish(String(self.detected_class or "none"))

        if self.show_window:
            cv2.imshow("Traffic Light Detection", frame)
            cv2.waitKey(1)

    # ================================================================
    #  LiDAR scan callback
    #  Improved: EMA distance filter to reduce jitter
    # ================================================================
    def cb_scan(self, msg):
        if self.target_angle is None:
            return

        distances = []
        for i, r in enumerate(msg.ranges):
            if math.isinf(r) or math.isnan(r) or r < msg.range_min or r > msg.range_max:
                continue

            a = msg.angle_min + i * msg.angle_increment
            pt = PointStamped()
            pt.header.frame_id = self.laser_frame
            pt.header.stamp    = msg.header.stamp  # 以激光雷达时间戳为准
            pt.point.x = r * math.cos(a)
            pt.point.y = r * math.sin(a)
            pt.point.z = 0.0

            try:
                self.tf_listener.waitForTransform(
                    self.robot_frame, self.laser_frame,
                    msg.header.stamp, rospy.Duration(0.1))
                pt_base = self.tf_listener.transformPoint(self.robot_frame, pt)
                laser_angle = math.atan2(pt_base.point.y, pt_base.point.x)
                if abs(laser_angle - self.target_angle) < self.angle_tolerance:
                    distances.append(r)
            except Exception:
                continue

        raw_dist = min(distances) if distances else float("inf")

        # ---- Improved: EMA filter for distance ----
        self._dist_buffer.append(raw_dist)
        # Compute mean of buffer (simple moving average)
        valid = [d for d in self._dist_buffer if d != float("inf")]
        if valid:
            self._dist_filtered = sum(valid) / len(valid)
        else:
            self._dist_filtered = float("inf")

        self.light_distance = self._dist_filtered
        self.pub_distance.publish(Float32(self.light_distance))

    # ================================================================
    #  Mock detection callbacks (simulation, bypass YOLO)
    # ================================================================
    def cb_mock_status(self, msg):
        self.detected_class = msg.data if msg.data != "none" else None
        rospy.logdebug("Mock status: %s", msg.data)

    def cb_mock_distance(self, msg):
        self.light_distance = msg.data
        rospy.logdebug("Mock distance: %.2f", msg.data)

    # ================================================================
    #  State machine (10 Hz)
    # ================================================================
    def cb_state_machine(self, _event):
        self.pub_nav.publish(String(self.state))

        handlers = {
            self.IDLE:               self._do_idle,
            self.COLLECTING:         self._do_collecting,
            self.NAVIGATING:         self._do_navigating,
            self.STOPPING_FOR_RED:   self._do_stopping_for_red,
            self.WAITING_GREEN:      self._do_waiting_green,
            self.DONE:               lambda: None,
        }
        handlers.get(self.state, lambda: None)()

    def _do_idle(self):
        pass

    def _do_collecting(self):
        pass

    # ------------------------------------------------------------------
    #  NAVIGATING: drive to waypoint, watch for red lights
    #  Improved: red entry debouncing
    # ------------------------------------------------------------------
    def _do_navigating(self):
        status = self.move_base_client.get_state()

        # --- Goal completed -> advance ---
        if status == actionlib.GoalStatus.SUCCEEDED:
            rospy.loginfo("Waypoint %d/%d reached.",
                          self.current_wp_idx + 1, len(self.waypoints))
            self.current_wp_idx += 1
            if self.current_wp_idx >= len(self.waypoints):
                self.state = self.DONE
                rospy.loginfo("=== All waypoints DONE! ===")
                return
            self._send_waypoint_goal()

        # --- Still navigating -> watch for red ---
        elif status in (actionlib.GoalStatus.ACTIVE, actionlib.GoalStatus.PENDING):
            pass

        # --- Failed (not cancelled by us) -> retry ---
        elif status in (actionlib.GoalStatus.ABORTED,
                        actionlib.GoalStatus.REJECTED):
            if not self.goal_cancelled:
                rospy.logwarn("Goal %d failed (code=%d), retrying ...",
                              self.current_wp_idx + 1, status)
                self._send_waypoint_goal()
            self.goal_cancelled = False

        # --- No goal / LOST / RECALLED / PREEMPTING -> send one ---
        else:
            self._send_waypoint_goal()

        # ---- Improved: red entry debouncing ----
        effective_hold = self.hold_distance + self.safety_margin
        if self.detected_class == "red" and self.light_distance <= self.stop_distance:
            self._red_entry_count += 1
            if self._red_entry_count >= self.red_debounce_n:
                rospy.loginfo("RED confirmed (%d frames) at %.2f m. -> STOPPING_FOR_RED",
                              self._red_entry_count, self.light_distance)
                self.move_base_client.cancel_all_goals()
                self.goal_cancelled = True
                self._red_entry_count = 0
                self.state = self.STOPPING_FOR_RED
                self.red_wait_start = time.time()
        else:
            self._red_entry_count = 0

    # ------------------------------------------------------------------
    #  STOPPING_FOR_RED: gradual proportional deceleration
    #  Improved: direct velocity control instead of move_base approach goal
    # ------------------------------------------------------------------
    def _do_stopping_for_red(self):
        """Proportional deceleration to hold_distance + safety_margin."""
        elapsed = time.time() - (self.red_wait_start or time.time())

        # Timeout safety
        if elapsed > self.red_wait_timeout:
            rospy.logwarn("Red wait timeout (%.1f s), resuming.", elapsed)
            self.state = self.NAVIGATING
            self._send_waypoint_goal()
            return

        effective_hold = self.hold_distance + self.safety_margin

        # Immediate stop if already within hold distance
        if self.light_distance <= effective_hold:
            self._hold_robot()
            self.state = self.WAITING_GREEN
            rospy.loginfo("Stopped at %.2f m (hold=%.2f+%.2f). Waiting for green ...",
                          self.light_distance, self.hold_distance, self.safety_margin)
            return

        # If red detection lost, count frames before resuming
        if self.detected_class != "red":
            self._red_entry_count += 1
            if self._red_entry_count >= self.red_debounce_n * 3:
                rospy.loginfo("Red lost for %d frames, resuming.", self._red_entry_count)
                self._red_entry_count = 0
                self.state = self.NAVIGATING
                self._send_waypoint_goal()
                return
        else:
            self._red_entry_count = 0

        # ---- Improved: Proportional deceleration (from CarND waypoint_updater pattern) ----
        # v = creep + (max_approach - creep) * ratio
        # where ratio = (dist - hold) / (stop - hold), clamped to [0, 1]
        brake_range = self.stop_distance - effective_hold
        if brake_range <= 0:
            rospy.logwarn("Invalid brake_range (stop=%.1f <= hold=%.1f), using creep",
                          self.stop_distance, effective_hold)
            target_vel = self.creep_vel
        else:
            remaining = self.light_distance - effective_hold
            ratio = max(0.0, min(1.0, remaining / brake_range))
            target_vel = self.creep_vel + (self.max_approach_vel - self.creep_vel) * ratio

        cmd = Twist()
        cmd.linear.x = target_vel
        cmd.linear.y = 0.0
        cmd.angular.z = 0.0
        self.pub_cmd_vel.publish(cmd)

    # ------------------------------------------------------------------
    #  WAITING_GREEN: hold position until green confirmed
    # ------------------------------------------------------------------
    def _do_waiting_green(self):
        self._hold_robot()

        if self.detected_class == "green":
            self.green_count += 1
            if self.green_count >= self.green_confirm_n:
                rospy.loginfo("GREEN confirmed (%d frames). Resuming navigation.",
                              self.green_count)
                self.green_count = 0
                self.state = self.NAVIGATING
                self._send_waypoint_goal()
                return
        else:
            self.green_count = 0

        # Timeout fallback
        elapsed = time.time() - (self.red_wait_start or time.time())
        if elapsed > self.red_wait_timeout:
            rospy.logwarn("Red wait timeout (%.1f s). Resuming anyway.", elapsed)
            self.green_count = 0
            self.state = self.NAVIGATING
            self._send_waypoint_goal()

    # ================================================================
    #  Navigation helpers
    # ================================================================
    def _send_waypoint_goal(self):
        """Send the current waypoint as a move_base goal."""
        if self.current_wp_idx >= len(self.waypoints):
            return
        x, y = self.waypoints[self.current_wp_idx]
        goal = MoveBaseGoal()
        goal.target_pose.header.frame_id = "map"
        goal.target_pose.header.stamp    = rospy.Time.now()
        goal.target_pose.pose.position.x = x
        goal.target_pose.pose.position.y = y
        goal.target_pose.pose.orientation.w = 1.0

        self.move_base_client.send_goal(goal)
        rospy.loginfo("-> WP %d/%d  (%.2f, %.2f)",
                      self.current_wp_idx + 1, len(self.waypoints), x, y)

    def _hold_robot(self):
        """Publish zero velocity to maintain position."""
        cmd = Twist()
        cmd.linear.x  = 0.0
        cmd.linear.y  = 0.0
        cmd.angular.z = 0.0
        self.pub_cmd_vel.publish(cmd)

    # ================================================================
    #  Shutdown
    # ================================================================
    def shutdown(self):
        self._hold_robot()
        cv2.destroyAllWindows()
        rospy.loginfo("MultiNavTrafficLight node shutdown.")


# ================================================================
#  Entry point
# ================================================================
if __name__ == "__main__":
    # ARM64 (Jetson) OpenMP compatibility – harmless on x86
    try:
        os.environ.setdefault("LD_PRELOAD",
                              "/usr/lib/aarch64-linux-gnu/libgomp.so.1")
    except Exception:
        pass

    try:
        node = MultiNavTrafficLightNode()
        rospy.on_shutdown(node.shutdown)
        rospy.spin()
    except rospy.ROSInterruptException:
        pass
    finally:
        cv2.destroyAllWindows()
