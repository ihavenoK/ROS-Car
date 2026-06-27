#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
模拟红绿灯节点（方案 A：绕过 YOLO 直接发布状态和距离）

原理：
  读取 /gazebo/model_states 获取小车实时位置
  → 计算与各红绿灯的欧氏距离
  → 取最近的红绿灯，按时间循环切换红/绿
  → 发布 /traffic_light_status 和 /traffic_light_distance
  → 支持手动模式：/manual_traffic_light 话题接收 "red" / "green" / "auto"

红绿灯坐标统一写在本文件顶部的 TRAFFIC_LIGHTS 字典里，
仿真环境下可随时修改。
"""

import rospy
import math
from std_msgs.msg import String, Float32
from gazebo_msgs.msg import ModelStates
from geometry_msgs.msg import Twist


# ============================================================
#  红绿灯坐标 — 按你的 world 实际情况修改
# ============================================================
TRAFFIC_LIGHTS = {
    "light_1": {"x": 5.0,  "y": 0.0,  "state": "red"},
    "light_2": {"x": 10.0, "y": 0.0,  "state": "green"},
    "light_3": {"x": 15.0, "y": 0.0,  "state": "red"},
}

# 检测范围 (m) — 小车进入此范围才开始切换
DETECTION_RANGE = 5.0
# 红绿灯切换周期 (秒)
CYCLE_SECONDS = 15.0
# 循环帧率
RATE = 10


class TrafficLightMock:
    def __init__(self):
        rospy.init_node("traffic_light_mock")

        self.robot_pose = None   # (x, y)

        # 为每个灯初始化切换计时器
        self.cycle_start = rospy.Time.now()
        self.mode = "auto"       # auto / manual
        self.manual_state = "red"

        # 订阅
        rospy.Subscriber("/gazebo/model_states", ModelStates, self.cb_states)
        rospy.Subscriber("/manual_traffic_light", String, self.cb_manual)

        # 发布（专用话题，multi_nav 通过 ~use_mock 参数订阅）
        self.pub_status   = rospy.Publisher("/mock_traffic_light_status",  String,  queue_size=10)
        self.pub_distance  = rospy.Publisher("/mock_traffic_light_distance", Float32, queue_size=10)

        self.rate = rospy.Rate(RATE)
        rospy.loginfo("TrafficLightMock ready. Lights: %s", list(TRAFFIC_LIGHTS.keys()))

    # ------------------------------------------------------------
    def cb_states(self, msg):
        """从 /gazebo/model_states 取小车位置"""
        try:
            idx = msg.name.index("roscar")
            p = msg.pose[idx].position
            self.robot_pose = (p.x, p.y)
        except ValueError:
            pass   # 小车还没 spawn

    # ------------------------------------------------------------
    def cb_manual(self, msg):
        """手动控制：接收 red / green / auto"""
        if msg.data == "auto":
            self.mode = "auto"
            rospy.loginfo("TrafficLightMock → AUTO mode")
        elif msg.data in ("red", "green"):
            self.mode = "manual"
            self.manual_state = msg.data
            rospy.loginfo("TrafficLightMock → MANUAL: %s", msg.data)

    # ------------------------------------------------------------
    def run(self):
        while not rospy.is_shutdown():
            self._update()
            self.rate.sleep()

    def _update(self):
        if self.robot_pose is None:
            return

        rx, ry = self.robot_pose

        # 找最近的红绿灯
        best_name = None
        best_dist = float("inf")
        for name, light in TRAFFIC_LIGHTS.items():
            d = math.hypot(rx - light["x"], ry - light["y"])
            if d < best_dist:
                best_dist = d
                best_name = name

        # 距离超出检测范围 → 不发
        if best_dist > DETECTION_RANGE:
            self.pub_status.publish(String("none"))
            self.pub_distance.publish(Float32(float("inf")))
            return

        # 确定当前状态
        if self.mode == "manual":
            current_state = self.manual_state
        else:
            # 自动模式：最近的红绿灯按周期切换
            elapsed = (rospy.Time.now() - self.cycle_start).to_sec()
            half = CYCLE_SECONDS / 2.0
            current_state = "red" if (elapsed % CYCLE_SECONDS) < half else "green"

        self.pub_status.publish(String(current_state))
        self.pub_distance.publish(Float32(best_dist))

    # ------------------------------------------------------------
    def shutdown(self):
        rospy.loginfo("TrafficLightMock shutdown.")


if __name__ == "__main__":
    try:
        node = TrafficLightMock()
        rospy.on_shutdown(node.shutdown)
        node.run()
    except rospy.ROSInterruptException:
        pass
