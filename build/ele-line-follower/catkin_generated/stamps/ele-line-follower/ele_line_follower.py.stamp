#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import rospy
import subprocess
from geometry_msgs.msg import Twist
from nav_msgs.msg import OccupancyGrid


class EleLineFollower:
    def __init__(self):
        rospy.init_node("ele_line_follower", anonymous=False)

        # 发布速度
        self.cmd_pub = rospy.Publisher(
            "/cmd_vel",
            Twist,
            queue_size=10
        )

        # 防止重复保存
        self.map_saved = False

        # Ctrl+C / rosnode kill / roscore shutdown
        rospy.on_shutdown(self.on_shutdown)

        rospy.loginfo("EleLineFollower started. Ctrl+C to stop & save map.")

    # ================== Ctrl+C 回调 ==================
    def on_shutdown(self):
        if self.map_saved:
            return

        rospy.logwarn("Shutdown detected! Stop robot and save map...")

        # 1️⃣ 停车
        self.stop_robot()

        # 2️⃣ 确保 /map 还在（gmapping 仍运行）
        try:
            rospy.wait_for_message("/map", OccupancyGrid, timeout=2.0)
        except rospy.ROSException:
            rospy.logerr("No /map received, map saving aborted")
            return

        # 3️⃣ 稍等一会，保证最后一帧写入
        rospy.sleep(0.5)

        # 4️⃣ 保存地图
        self.save_map()

        self.map_saved = True
        rospy.loginfo("Shutdown handling finished")

    # ================== 停车 ==================
    def stop_robot(self):
        twist = Twist()
        twist.linear.x = 0.0
        twist.angular.z = 0.0

        for _ in range(5):
            self.cmd_pub.publish(twist)
            rospy.sleep(0.1)

        rospy.loginfo("Robot stopped")

    # ================== 保存地图 ==================
    def save_map(self):
        map_dir = "/home/gdut/catkin_roscar/start_roscar/map"
        map_name = "roscar_map"
        map_path = map_dir + "/" + map_name

        rospy.loginfo("Saving map to %s", map_path)

        subprocess.call([
            "rosrun",
            "map_server",
            "map_saver",
            "-f",
            map_path
        ])

        rospy.loginfo("Map saved successfully")

    # ================== 主循环 ==================
    def run(self):
        rate = rospy.Rate(20)
        twist = Twist()

        while not rospy.is_shutdown():
            # ===== 这里放你的循线控制算法 =====
            total = self.L + self.C + self.R + 1e-6  # 防止除零

            # 归一化误差：右强 → 右偏 → 角速度为负
            error = (self.L - self.R) / total

            omega_z = self.Kp * error

            cmd = Twist()
            cmd.linear.x = self.v_forward
            cmd.angular.z = omega_z

            self.pub.publish(cmd)
            self.rate.sleep()

            rate.sleep()


if __name__ == "__main__":
    try:
        node = EleLineFollower()
        node.run()
    except rospy.ROSInterruptException:
        pass

