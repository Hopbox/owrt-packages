include $(TOPDIR)/rules.mk

PKG_NAME:=monitor
PKG_VERSION:=1.0.1
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/hopbox-monitor-$(PKG_VERSION)
PKG_SOURCE:=hopbox-monitor-x86-64-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL=https://downloads.hopbox.in/releases/adhoc/hopbox-monitor/x86-64/
PKG_HASH=0cf86a1e507eb770f61e5e6af2d68830c9917d77d3df8072a9b4c7109fe503cc
PKG_CAT:=zcat

PKG_MAINTAINER:=Soubhagya Rath <soubhagya@unmukti.in>

include $(INCLUDE_DIR)/package.mk

define Package/monitor
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=+libubox
  TITLE:=Hopbox monitoring utility
  URL:=https://gitlab.hopbox.in/hopbox/monitor
endef

define Package/monitor/description
 Monitor is the swiss knife for managing Hopbox devices.
endef

define Package/monitor/install
	$(INSTALL_DIR) $(1)/etc/hotplug.d/monitor $(1)/etc/init.d $(1)/sbin
	$(INSTALL_CONF) ./files/monitor.hotplug $(1)/etc/hotplug.d/monitor/20-monitor
	$(INSTALL_BIN) ./files/monitor.init $(1)/etc/init.d/monitor
	$(CP) $(PKG_INSTALL_DIR)/usr/sbin/monitor $(1)/sbin/
endef

$(eval $(call BuildPackage,monitor))
