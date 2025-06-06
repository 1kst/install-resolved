# install-resolved

一键安装并配置 `systemd-resolved` 的脚本，适用于 Debian 12 或其他支持 `systemd` 的系统。

该脚本适合用于 DNS 请求频繁的场景（如：高速专线、科学出口、内网 DNS 缓存），自动配置 DNS 缓存和公共 DNS 服务器，提升解析效率。

## 📦 功能

- 安装 `systemd-resolved`
- 配置公共 DNS（Cloudflare `1.1.1.1` 和 Google `8.8.8.8`）
- 启动并启用缓存服务
- 自动链接 `/etc/resolv.conf`
- 兼容 DHCP 无 DNS 下发的情况

## 🚀 一键使用

**推荐使用 `curl`：**

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/1kst/install-resolved/main/install-resolved.sh)
