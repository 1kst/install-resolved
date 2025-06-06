#!/bin/bash

set -e

echo "==> 安装 systemd-resolved..."
apt update
apt install -y systemd systemd-resolved

echo "==> 配置 /etc/systemd/resolved.conf..."
CONFIG_FILE="/etc/systemd/resolved.conf"
if ! grep -q "^DNS=" "$CONFIG_FILE"; then
    sed -i '/^\[Resolve\]/a DNS=1.1.1.1 8.8.8.8' "$CONFIG_FILE"
else
    sed -i 's/^DNS=.*/DNS=1.1.1.1 8.8.8.8/' "$CONFIG_FILE"
fi

echo "==> 启动并启用 systemd-resolved..."
systemctl enable systemd-resolved
systemctl restart systemd-resolved

echo "==> 设置 DNS 链接 /etc/resolv.conf 到 systemd 管理的文件..."
ln -sf /run/systemd/resolve/stub-resolv.conf /etc/resolv.conf

echo "==> 当前 DNS 配置："
cat /etc/resolv.conf

echo "✅ 完成：systemd-resolved 已安装并配置。"
