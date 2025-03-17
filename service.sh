#!/system/bin/sh

# 禁用 core 文件生成
sysctl -w kernel.core_pattern=/dev/null
sysctl -w kernel.core_uses_pid=0
ulimit -c 0
echo "/dev/null" > /proc/sys/kernel/core_pattern

#保险起见，检测一下corefile目录是否有corefile文件生成
corefile=/data/corefile/
sleep 60
# 检查目录是否非空
if [ -n "$(find "$corefile" -maxdepth 1 -mindepth 1 -print -quit)" ]; then
    echo "发现文件，正在清空目录..."
    # 删除所有内容（包括隐藏文件）
    find "$corefile" -mindepth 1 -exec rm -rf {} +
fi>