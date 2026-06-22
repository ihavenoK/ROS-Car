#!/usr/bin/env python3
import rospy
import subprocess
from std_msgs.msg import Bool

class MapBuildManager:
    def __init__(self):
        rospy.init_node("map_build_manager")
        rospy.Subscriber("/mapping_done", Bool, self.done_cb)
        self.saved = False
        rospy.loginfo("等待 /mapping_done ...")

    def done_cb(self, msg):
        if msg.data and not self.saved:
            rospy.loginfo("收到 mapping_done，开始保存地图")
            subprocess.call([
                "rosrun", "map_server", "map_saver",
                "-f", "/home/gdut/catkin_roscar/start_roscar/map"
            ])
            self.saved = True
            rospy.loginfo("地图保存完成")

    def spin(self):
        rospy.spin()

if __name__ == "__main__":
    MapBuildManager().spin()
