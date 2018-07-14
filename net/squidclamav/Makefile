#
# Copyright (C) 2006-2014 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=squidclamav
PKG_VERSION:=6.16
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/$(PKG_NAME)
PKG_LICENSE:=GPLv2+
PKG_HASH:=ed724841923f3e5a96dd7192a3cfd176df106eda250b417e7c85f515440c4978

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

PKG_FIXUP:=autoreconf
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
  SUBMENU:=Web Servers/Proxies
  SECTION:=net
  CATEGORY:=Network
  DEPENDS+=+c-icap +squid +clamav
  TITLE:=Clamav ICAP service and redirector for Squid
endef

define Package/$(PKG_NAME)/description
	SquidClamav is an antivirus for Squid proxy based on the Awards winning ClamAv anti-virus toolkit.
	Using it will help you securing your home or enterprise network web traffic. SquidClamav is the
	most efficient Squid Redirector and ICAP service antivirus tool for HTTP traffic available for free,
	it is written in C and can handle thousand of connections.
endef

CONFIGURE_VARS += \
	ac_cv_10031b_ipc_sem=yes \
	ac_cv_fcntl=yes

CONFIGURE_ARGS += \
	--with-c-icap=$(STAGING_DIR)/usr

define Build/Prepare
	$(call Build/Prepare/Default)
	echo $(PKG_VERSION) > $(PKG_BUILD_DIR)/VERSION.m4
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/c_icap/* $(1)/usr/lib/c_icap
	$(CP) $(PKG_INSTALL_DIR/usr/lib/squidclamav/* $(1)/usr/lib/squidclamav
	$(INSTALL_DIR) $(1)/etc/c-icap 
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/etc/squidclamav.conf $(1)/etc/c-icap
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
