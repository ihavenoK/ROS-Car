#!/bin/bash
# Gazebo 仿真环境变量设置
# 用法: source setup_gazebo.sh

# 获取脚本所在目录
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# 添加世界文件路径
export GAZEBO_RESOURCE_PATH=$SCRIPT_DIR/worlds:$GAZEBO_RESOURCE_PATH

# 添加模型路径（同时保留默认 Gazebo 模型路径）
export GAZEBO_MODEL_PATH=$SCRIPT_DIR/models:$GAZEBO_MODEL_PATH

echo "[Gazebo] 环境变量已设置:"
echo "  GAZEBO_MODEL_PATH=${GAZEBO_MODEL_PATH}"
echo "  GAZEBO_RESOURCE_PATH=${GAZEBO_RESOURCE_PATH}"
