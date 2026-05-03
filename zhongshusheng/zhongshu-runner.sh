#!/bin/bash
# 中书省 AppImage 自解压运行程序
# 版本 1.0.0

APP_NAME="中书省"
APP_VERSION="1.0.0"

# 创建临时目录
TEMP_DIR=$(mktemp -d)
trap 'rm -rf "$TEMP_DIR"' EXIT

# 解包数据
echo "正在解包 $APP_NAME..."
ARCHIVE=$(awk '/^__ARCHIVE_BELOW__/ {print NR + 1; exit 0; }' "$0")
tail -n +$ARCHIVE "$0" | tar -xzf - -C "$TEMP_DIR"

# 设置权限
chmod +x "$TEMP_DIR/usr/bin/zhongshu-app" 2>/dev/null

# 运行应用
cd "$TEMP_DIR/opt/zhongshu-provinces/src"
python3 main.py "$@"

exit 0

__ARCHIVE_BELOW__