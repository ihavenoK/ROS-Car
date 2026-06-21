cmake_minimum_required(VERSION 3.0.2)
project(multi_nav_traffic)

find_package(catkin REQUIRED COMPONENTS
  rospy
  actionlib
  move_base_msgs
  geometry_msgs
  sensor_msgs
  std_msgs
  std_srvs
  cv_bridge
  tf
)

catkin_package(
  CATKIN_DEPENDS
    rospy
    actionlib
    move_base_msgs
    geometry_msgs
    sensor_msgs
    std_msgs
    std_srvs
    cv_bridge
    tf
)

include_directories(
  ${catkin_INCLUDE_DIRS}
)

#############
## Install ##
#############

catkin_install_python(PROGRAMS
  scripts/multi_nav_traffic_light_node.py
  DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
)

install(DIRECTORY launch/
  DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}/launch
)

install(DIRECTORY model/
  DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}/model
)
