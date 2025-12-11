#
# Copyright (C) 2024 OpenWrt.org
#
# This is free software, licensed under the MIT License.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=cli-proxy-api
PKG_VERSION:=6.0.0
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/router-for-me/CLIProxyAPI.git
PKG_SOURCE_VERSION:=HEAD
PKG_MIRROR_HASH:=skip

PKG_MAINTAINER:=CLIProxyAPI Team
PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

PKG_BUILD_DEPENDS:=golang/host
PKG_BUILD_PARALLEL:=1
PKG_USE_MIPS16:=0

GO_PKG:=github.com/router-for-me/CLIProxyAPI/v6
GO_PKG_BUILD_PKG:=$(GO_PKG)/cmd/server
GO_PKG_LDFLAGS:=-s -w
GO_PKG_LDFLAGS_X:=\
	main.Version=$(PKG_VERSION) \
	main.Commit=$(PKG_SOURCE_VERSION) \
	main.BuildDate=$(shell date -u +%Y-%m-%dT%H:%M:%SZ)

include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/golang/golang-package.mk

define Package/cli-proxy-api
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Web Servers/Proxies
  TITLE:=CLI Proxy API Server
  URL:=https://github.com/router-for-me/CLIProxyAPI
  DEPENDS:=$(GO_ARCH_DEPENDS) +ca-bundle
endef

define Package/cli-proxy-api/description
  A proxy server that provides OpenAI/Gemini/Claude/Codex compatible 
  API interfaces for CLI. Supports OAuth login for OpenAI Codex, 
  Claude Code, Qwen Code, and iFlow with multi-account management.
endef

define Package/cli-proxy-api/conffiles
/etc/config/cliproxyapi
/etc/cli-proxy-api/config.yaml
endef

define Build/Compile
	$(call GoPackage/Build/Compile)
endef

define Package/cli-proxy-api/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(GO_PKG_BUILD_BIN_DIR)/server $(1)/usr/bin/cli-proxy-api
	
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/cli-proxy-api.init $(1)/etc/init.d/cli-proxy-api
	
	$(INSTALL_DIR) $(1)/etc/cli-proxy-api
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/config.example.yaml $(1)/etc/cli-proxy-api/config.example.yaml
	
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_CONF) ./files/cliproxyapi.config $(1)/etc/config/cliproxyapi
endef

$(eval $(call GoBinPackage,cli-proxy-api))
$(eval $(call BuildPackage,cli-proxy-api))
