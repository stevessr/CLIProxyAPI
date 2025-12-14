# CLI Proxy API for OpenWrt

[English](#english) | [中文](#中文)

## English

### Overview

This directory contains OpenWrt packages for CLI Proxy API, including:
- `cli-proxy-api`: The main proxy server package
- `luci-app-cli-proxy-api`: LuCI web interface for managing the service

### Features

- Full OpenWrt integration with init.d service management
- LuCI web interface for easy configuration
- Support for multiple architectures (aarch64, arm, mips, x86_64)
- OAuth authentication for multiple providers (OpenAI, Claude, Gemini, Qwen, iFlow)
- Multi-account management with load balancing

### Installation

#### From IPK Files

1. Download the appropriate IPK files for your architecture from the releases page
2. Upload them to your OpenWrt router
3. Install via SSH:

```bash
opkg install cli-proxy-api_*.ipk
opkg install luci-app-cli-proxy-api_*.ipk
```

#### From Source

1. Clone OpenWrt SDK or buildroot
2. Copy the package directories to your OpenWrt feeds
3. Update feeds and install packages:

```bash
./scripts/feeds update -a
./scripts/feeds install -a
make menuconfig  # Select cli-proxy-api and luci-app-cli-proxy-api
make package/cli-proxy-api/compile
make package/luci-app-cli-proxy-api/compile
```

### Configuration

#### Via LuCI Web Interface

1. Navigate to **Services > CLI Proxy API**
2. Enable the service
3. Configure port, listen address, and other settings
4. Click **Save & Apply**

#### Via SSH/Command Line

The service can be controlled using standard OpenWrt commands:

```bash
# Start service
/etc/init.d/cli-proxy-api start

# Stop service
/etc/init.d/cli-proxy-api stop

# Restart service
/etc/init.d/cli-proxy-api restart

# Enable on boot
/etc/init.d/cli-proxy-api enable

# Disable on boot
/etc/init.d/cli-proxy-api disable
```

#### OAuth Login

For OAuth authentication, use SSH to run login commands:

```bash
# Google/Gemini
cli-proxy-api -login -config /etc/cli-proxy-api/config.yaml

# OpenAI Codex
cli-proxy-api -codex-login -config /etc/cli-proxy-api/config.yaml

# Claude Code
cli-proxy-api -claude-login -config /etc/cli-proxy-api/config.yaml

# Qwen Code
cli-proxy-api -qwen-login -config /etc/cli-proxy-api/config.yaml

# iFlow
cli-proxy-api -iflow-login -config /etc/cli-proxy-api/config.yaml
```

### Configuration File

The main configuration file is located at `/etc/cli-proxy-api/config.yaml`. 

An example configuration is provided at `/etc/cli-proxy-api/config.example.yaml`.

For detailed configuration options, see the [main documentation](https://help.router-for.me/).

### File Locations

- Binary: `/usr/bin/cli-proxy-api`
- Init script: `/etc/init.d/cli-proxy-api`
- UCI config: `/etc/config/cliproxyapi`
- Configuration file: `/etc/cli-proxy-api/config.yaml`
- Authentication directory: `/var/lib/cli-proxy-api`
- Log file: `/var/log/cli-proxy-api.log` (if configured)

### Building

The packages are automatically built via GitHub Actions for multiple architectures. See `.github/workflows/openwrt-build.yml` for the build workflow.

### Supported Architectures

- aarch64_generic (ARM 64-bit)
- arm_cortex-a9 (ARM Cortex-A9)
- mips_24kc (MIPS 24Kc)
- mipsel_24kc (MIPS 24Kc Little Endian)
- x86_64 (64-bit x86)

---

## 中文

### 概述

此目录包含 CLI Proxy API 的 OpenWrt 软件包，包括：
- `cli-proxy-api`：主代理服务器软件包
- `luci-app-cli-proxy-api`：用于管理服务的 LuCI Web 界面

### 功能特性

- 完整的 OpenWrt 集成，支持 init.d 服务管理
- LuCI Web 界面便于配置
- 支持多种架构（aarch64、arm、mips、x86_64）
- 支持多个提供商的 OAuth 认证（OpenAI、Claude、Gemini、Qwen、iFlow）
- 多账户管理与负载均衡

### 安装

#### 从 IPK 文件安装

1. 从 releases 页面下载适合你架构的 IPK 文件
2. 上传到你的 OpenWrt 路由器
3. 通过 SSH 安装：

```bash
opkg install cli-proxy-api_*.ipk
opkg install luci-app-cli-proxy-api_*.ipk
```

#### 从源码编译

1. 克隆 OpenWrt SDK 或 buildroot
2. 将软件包目录复制到 OpenWrt feeds
3. 更新 feeds 并安装软件包：

```bash
./scripts/feeds update -a
./scripts/feeds install -a
make menuconfig  # 选择 cli-proxy-api 和 luci-app-cli-proxy-api
make package/cli-proxy-api/compile
make package/luci-app-cli-proxy-api/compile
```

### 配置

#### 通过 LuCI Web 界面

1. 导航至 **服务 > CLI Proxy API**
2. 启用服务
3. 配置端口、监听地址和其他设置
4. 点击 **保存并应用**

#### 通过 SSH/命令行

可以使用标准 OpenWrt 命令控制服务：

```bash
# 启动服务
/etc/init.d/cli-proxy-api start

# 停止服务
/etc/init.d/cli-proxy-api stop

# 重启服务
/etc/init.d/cli-proxy-api restart

# 开机自启
/etc/init.d/cli-proxy-api enable

# 禁用开机自启
/etc/init.d/cli-proxy-api disable
```

#### OAuth 登录

OAuth 认证需要通过 SSH 运行登录命令：

```bash
# Google/Gemini
cli-proxy-api -login -config /etc/cli-proxy-api/config.yaml

# OpenAI Codex
cli-proxy-api -codex-login -config /etc/cli-proxy-api/config.yaml

# Claude Code
cli-proxy-api -claude-login -config /etc/cli-proxy-api/config.yaml

# Qwen Code
cli-proxy-api -qwen-login -config /etc/cli-proxy-api/config.yaml

# iFlow
cli-proxy-api -iflow-login -config /etc/cli-proxy-api/config.yaml
```

### 配置文件

主配置文件位于 `/etc/cli-proxy-api/config.yaml`。

示例配置位于 `/etc/cli-proxy-api/config.example.yaml`。

详细配置选项请参见[主文档](https://help.router-for.me/cn/)。

### 文件位置

- 二进制文件：`/usr/bin/cli-proxy-api`
- Init 脚本：`/etc/init.d/cli-proxy-api`
- UCI 配置：`/etc/config/cliproxyapi`
- 配置文件：`/etc/cli-proxy-api/config.yaml`
- 认证目录：`/var/lib/cli-proxy-api`
- 日志文件：`/var/log/cli-proxy-api.log`（如果配置）

### 构建

软件包通过 GitHub Actions 自动为多个架构构建。详见 `.github/workflows/openwrt-build.yml` 构建工作流。

### 支持的架构

- aarch64_generic (ARM 64位)
- arm_cortex-a9 (ARM Cortex-A9)
- mips_24kc (MIPS 24Kc)
- mipsel_24kc (MIPS 24Kc 小端)
- x86_64 (64位 x86)

### 问题反馈

如有问题，请在 GitHub 上提交 Issue 或加入我们的交流群：
- QQ 群：188637136
- Telegram 群：https://t.me/CLIProxyAPI
