#!/system/bin/sh

# 禁用 core 文件生成
sysctl -w kernel.core_pattern=/dev/null
sysctl -w kernel.core_uses_pid=0