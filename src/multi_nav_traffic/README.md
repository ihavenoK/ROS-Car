# multi_nav_traffic — 多点导航 + 红绿灯识别 ROS 包

## 1. 项目概述

基于 ROS Noetic + catkin_roscar 小车框架，新增多点自动导航与红绿灯识别响应功能。核心节点 `multi_nav_traffic_light_node.py` 实现以下能力：

| 功能 | 说明 |
|------|------|
| **多点导航** | RViz "Publish Point" 工具点击地图收集路径点，手动触发后按序自动导航 |
| **红绿灯检测** | YOLOv8 视觉分类 + LiDAR 测距融合，支持 red / green / yellow 三态 |
| **红灯停** | 检测到红灯后渐变减速，停在灯前 1.5m + 安全余量，等待绿灯 |
| **绿灯行** | 连续确认绿灯后恢复导航到被中断的路径点 |
| **室外优化** | Gamma 校正（默认 1.5）压暗强光场景，提高识别率 |
| **抗干扰** | 置信度过滤、状态去抖、距离 EMA 滤波，减少误触发 |

---

## 2. 系统架构

```
                    ┌─────────────────────────┐
                    │        RViz              │
                    │  Publish Point 工具       │
                    └──────────┬──────────────┘
                               │ /clicked_point
                               ▼
┌──────────────────────────────────────────────────────────────┐
│               multi_nav_traffic_light_node                    │
│                                                               │
│  ┌─────────────┐   ┌──────────────┐   ┌───────────────────┐  │
│  │ 路径点收集   │   │ 红绿灯检测    │   │ 状态机 (10 Hz)    │  │
│  │             │   │              │   │                   │  │
│  │ /clicked_   │   │ YOLO + Gamma │   │ IDLE              │  │
│  │ point →     │   │ + TF变换     │   │ → COLLECTING      │  │
│  │ waypoints[] │   │              │   │ → NAVIGATING      │  │
│  │             │   │ LiDAR距离     │   │ → STOPPING_FOR_RED│  │
│  │             │   │ + EMA滤波    │   │ → WAITING_GREEN   │  │
│  │             │   │              │   │ → DONE            │  │
│  └─────────────┘   └──────┬───────┘   └────────┬──────────┘  │
│                           │                     │             │
│                   发布:   │              move_base            │
│        /traffic_light_status    action client / cmd_vel       │
│        /traffic_light_distance                                │
└──────────────────────────────────────────────────────────────┘
         │                                              │
         ▼                                              ▼
┌─────────────────┐                          ┌──────────────────┐
│  /usb_cam/image │                          │  move_base       │
│  _raw (相机)     │                          │  (TEB局部规划)    │
└─────────────────┘                          └──────────────────┘
         │
         ▼
┌─────────────────┐
│  /scan (LiDAR)  │
│  RPLidar A3     │
└─────────────────┘
```

### 话题与服务一览

| 方向 | 名称 | 类型 | 说明 |
|------|------|------|------|
| **SUB** | `/clicked_point` | `PointStamped` | RViz Publish Point 工具 |
| **SUB** | `/usb_cam/image_raw` | `Image` | USB 摄像头 |
| **SUB** | `/scan` | `LaserScan` | RPLidar A3 |
| **PUB** | `/traffic_light_status` | `String` | 当前检测结果: "red" / "green" / "none" |
| **PUB** | `/traffic_light_distance` | `Float32` | LiDAR 测距结果 (m) |
| **PUB** | `/nav_state` | `String` | 状态机当前状态 |
| **PUB** | `/cmd_vel` | `Twist` | 红灯停车/减速时的速度指令 |
| **ACTION** | `/move_base` | `MoveBaseAction` | 发送导航目标 |
| **SRV** | `/start_multi_nav` | `Trigger` | 手动触发导航 |
| **SRV** | `/clear_waypoints` | `Trigger` | 清除所有路径点 |

---

## 3. 依赖

| 依赖 | 用途 |
|------|------|
| **ROS Noetic** | 框架，含 rospy / actionlib / tf / cv_bridge |
| **move_base** | 全局+局部路径规划（TEB local planner） |
| **Ultralytics YOLOv8** | 红绿灯视觉检测 |
| **OpenCV** | 图像处理 + Gamma 校正 |
| **numpy** | 数值计算、坐标变换 |
| **catkin_roscar** | 小车底层驱动（STM32 控制、RPLidar、USB 摄像头） |

---

## 4. 安装

```bash
# 1. 确保 catkin_roscar 已编译通过
cd ~/catkin_roscar
catkin_make
source devel/setup.bash

# 2. 安装 Python 依赖
pip install ultralytics opencv-python numpy

# 3. 将本包放入工作空间
cp -r multi_nav_traffic ~/catkin_roscar/catkin_roscar/src/

# 4. 编译
cd ~/catkin_roscar
catkin_make
source devel/setup.bash
```

> **Jetson 平台注意**：代码已内置 `LD_PRELOAD` 设置加载 ARM64 OpenMP 库，无需额外操作。

---

## 5. 使用方法

### 5.1 启动

```bash
# 终端 1：启动小车底层 + 导航栈 + 本节点
roslaunch multi_nav_traffic multi_nav.launch

# 终端 2：启动 RViz
rviz
```

> RViz 中需添加 "Publish Point" 工具面板，话题设为 `/clicked_point`。

### 5.2 操作流程

```
步骤 1: 在 RViz 中使用 "Publish Point" 工具在地图上点击路径点
        → 终端打印 "[WP N] (x, y)" 确认

步骤 2: 点击完所有路径点后，手动触发导航
        rosservice call /start_multi_nav
        → 终端打印 "=== Multi-nav START: N waypoints ==="

步骤 3: 小车自动按序导航
        → 期间自动检测红绿灯并响应

步骤 4: 如需重新规划，清除路径点
        rosservice call /clear_waypoints
```

### 5.3 监控话题

```bash
# 查看红绿灯检测状态
rostopic echo /traffic_light_status

# 查看红绿灯距离
rostopic echo /traffic_light_distance

# 查看导航状态机
rostopic echo /nav_state
```

---

## 6. 状态机详解

```
                    ┌──────────┐
                    │   IDLE   │ 等待用户操作
                    └────┬─────┘
                         │ 收到第一个 /clicked_point
                         ▼
                    ┌──────────┐
                    │COLLECTING│ 累积路径点
                    └────┬─────┘
                         │ rosservice call /start_multi_nav
                         ▼
          ┌──────────────────────────────┐
          │         NAVIGATING            │
          │  send_goal(WP[i]) → move_base │
          │  监控红绿灯                    │
          └──┬──────────────┬────────────┘
             │              │ 红灯确认 + 距离 < stop_distance
             │ 到达 WP[N]   ▼
             │         ┌──────────────────┐
             │         │ STOPPING_FOR_RED │
             │         │ 渐变减速到 hold   │
             │         │ distance          │
             │         └────────┬─────────┘
             │                  │ 到达停车位置
             │                  ▼
             │         ┌──────────────────┐
             │         │  WAITING_GREEN   │
             │         │ 零速保持          │
             │         │ 等待绿灯确认       │
             │         └────────┬─────────┘
             │                  │ 绿灯确认 / 超时
             │                  │ (回到 NAVIGATING，重发当前WP)
             │ ◄────────────────┘
             ▼
        ┌──────────┐
        │   DONE   │ 全部路径点完成
        └──────────┘
```

### 状态转换条件

| 转换 | 条件 |
|------|------|
| IDLE → COLLECTING | 收到 `/clicked_point` |
| COLLECTING → NAVIGATING | `/start_multi_nav` 服务调用 |
| NAVIGATING → DONE | 最后一个路径点到达 |
| NAVIGATING → STOPPING_FOR_RED | 连续 N 帧红灯 + 距离 < `stop_distance` |
| STOPPING_FOR_RED → WAITING_GREEN | 距离 ≤ `hold_distance` + `safety_margin` |
| WAITING_GREEN → NAVIGATING | 连续 N 帧绿灯 或 等待超时 |
| 任意 → IDLE | `/clear_waypoints` 服务调用 |

---

## 7. 红绿灯检测流水线

```
/usb_cam/image_raw
    │
    ▼
┌─────────────────┐
│ CvBridge:        │
│ ROS Image → BGR  │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│ Gamma 校正       │  gamma > 1 压暗（室外强光）
│ LUT 查表 (快速)  │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│ YOLOv8 推理      │  best_new.pt (3类: green/red/yellow)
│ 置信度过滤       │  丢弃 conf < confidence_threshold 的检测
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│ 选最近目标       │  取距离图像中心最近的检测框
│ (center-distance)│
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│ 像素 → 相机坐标  │  (u-cx)/fx, (v-cy)/fy
│ OpenCV → ROS     │  旋转矩阵变换
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│ TF 变换          │  camera_link → base_footprint
│ 计算目标角度     │  target_angle = atan2(y, x)
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│ LiDAR 匹配       │  遍历 /scan 射线
│ 角度容差 ±2°     │  筛选目标角度附近的激光点
│ 取最小距离       │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│ EMA 距离滤波     │  N帧滑动窗口平均
│ 输出             │  /traffic_light_distance
└─────────────────┘
```

---

## 8. 刹车减速逻辑（v1.1 改进）

v1.0 做法是「取消 move_base 目标 → 发一个新 goal 到停车点 → 等待 move_base 到达」。  
v1.1 改为 **直连 cmd_vel 等比减速**，避免短距离 move_base 的开销和抖动。

```
速度公式:
  brake_range = stop_distance - (hold_distance + safety_margin)
  ratio = max(0, min(1, (light_distance - hold - safety) / brake_range))
  target_vel = creep_vel + (max_approach_vel - creep_vel) × ratio

示例 (stop=3.0, hold=1.5, safety=0.2):
  距离 3.0m  → ratio=1.00 → vel=0.30 m/s  (全速接近)
  距离 2.5m  → ratio=0.77 → vel=0.24 m/s
  距离 2.0m  → ratio=0.38 → vel=0.15 m/s
  距离 1.7m  → ratio=0.00 → vel=0.05 m/s  (蠕动)
  距离 1.5m  → 立即停车，进入 WAITING_GREEN
```

---

## 9. 全部参数

| 参数 | 默认值 | 说明 |
|------|--------|------|
| `~model_path` | `best_new.pt` | YOLO 模型路径 |
| `~gamma` | `1.5` | 图像 gamma 校正 (强光建议 1.8~2.0) |
| `~confidence_threshold` | `0.5` | YOLO 置信度阈值 |
| `~red_debounce_frames` | `3` | 红灯确认所需连续帧数 |
| `~green_confirm_frames` | `5` | 绿灯确认所需连续帧数 |
| `~stop_distance` | `3.0` | 红灯制动触发距离 (m) |
| `~hold_distance` | `1.5` | 红灯前停车距离 (m) |
| `~safety_margin` | `0.2` | 附加安全余量 (m) |
| `~max_approach_vel` | `0.3` | 红灯接近最大速度 (m/s) |
| `~creep_vel` | `0.05` | 红灯接近蠕动速度 (m/s) |
| `~red_wait_timeout` | `30.0` | 红灯等待超时 (s) |
| `~angle_tolerance` | `2.0` | LiDAR 角度匹配容差 (度) |
| `~distance_filter_window` | `5` | 距离 EMA 滤波窗口 |
| `~camera_frame` | `camera_link` | 摄像头 TF frame |
| `~laser_frame` | `laser` | 激光雷达 TF frame |
| `~robot_frame` | `base_footprint` | 机器人基座 TF frame |
| `~fx / ~fy` | `400.0` | 相机焦距 (像素) |
| `~cx / ~cy` | `320 / 240` | 相机主点 (像素) |

所有参数均可在 `multi_nav.launch` 中调整，或运行时通过 `rosparam set` 动态修改。

---

## 10. 文件结构

```
multi_nav_traffic/
├── CMakeLists.txt                              # 构建配置
├── package.xml                                 # 包元数据
├── model/
│   └── best_new.pt                             # YOLOv8 模型 (3类: green/red/yellow)
├── launch/
│   └── multi_nav.launch                        # 启动文件
├── scripts/
│   └── multi_nav_traffic_light_node.py         # 核心节点 (573 行)
└── README.md                                   # 本文件
```

---

## 11. 实验环境

| 项目 | 配置 |
|------|------|
| 操作系统 | Ubuntu 20.04 |
| ROS 版本 | Noetic |
| Python | 3.8 |
| 计算平台 | NVIDIA Jetson (ARM64) 或 x86_64 |
| 小车底盘 | senior_diff (差速) |
| 激光雷达 | RPLidar A3 |
| 摄像头 | USB Camera (640×480) |
| 局部规划器 | TEB Local Planner |
| 全局规划器 | NavfnROS (Dijkstra) |

---

## 12. 已知问题与改进方向

| 问题 | 状态 | 计划 |
|------|------|------|
| `camera_link` TF frame 名可能与 `usb_cam` 不一致 | 需实测确认 | 通过 `~camera_frame` 参数适配 |
| YOLO 在 Jetson 上推理速度 | GPU 模式下约 15-20 FPS | CPU 模式下可考虑 TensorRT 加速 |
| 强逆光场景 gamma 校正不足 | 已支持动态调参 | 极端情况需加直方图均衡化 |
| LiDAR 角度匹配在转弯时偏差较大 | 当前容差 ±2° | 可改为基于 map 坐标的直接距离计算 |
| 红灯丢失恢复逻辑可能过于保守 | debounce × 3 帧 | 可根据场景调整 |

---

## 13. 参考资料

- [Udacity CarND-Capstone](https://github.com/udacity/CarND-Capstone) — 自动驾驶系统工程集成
- [ROS2 Autonomous Traffic Robot](https://github.com/pincheng0523/ROS2_autonomous-traffic-robot) — 视觉交通感知决策
- [ROS Navigation Stack](http://wiki.ros.org/navigation) — move_base 官方文档
- [TEB Local Planner](http://wiki.ros.org/teb_local_planner) — 局部路径规划器参数

---

*Author: 蔡博涵 · 广东工业大学 信息工程学院 · 3123002056*
