#
# Copyright (C) 2024 OpenWrt.org
#
# This is free software, licensed under the MIT License.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-cli-proxy-api
PKG_VERSION:=1.0.0
PKG_RELEASE:=1

PKG_MAINTAINER:=CLIProxyAPI Team
PKG_LICENSE:=MIT

LUCI_TITLE:=LuCI support for CLI Proxy API
LUCI_DEPENDS:=+cli-proxy-api
LUCI_PKGARCH:=all

include $(TOPDIR)/feeds/luci/luci.mk

# call BuildPackage - OpenWrt buildroot signature
