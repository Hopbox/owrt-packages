#
# Copyright (C) 2018 Unmukti Technology Pvt Ltd - unmukti.in
# 
# This is a free software, licensed under GNU General Public License v3.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=c-icap
PKG_VERSION:=0.5.3
PKG_RELEASE:=1

PKG_SOURCE:=c_icap-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/c-icap
PKG_HASH:=0238508c94a406c7a2c8a0ff9659e7ba631554eda55001b43351bb68f85121d2
PKG_BUILD_DIR:=$(BUILD_DIR)/c_icap-$(PKG_VERSION)

PKG_LICENSE:=LGPL-2.1+
PKG_LICENSE_FILES:=COPYING

PKG_BUILD_PARALLEL:=1
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/c-icap
	SECTION:=net
	CATEGORY:=Network
	SUBMENU:=Web Servers/Proxies
	TITLE:=c-icap server for squid, clamav etc
	URL:=http://c-icap.sourceforge.net/
endef

define Package/c-icap/description
	c-icap server implements the ICAP protocol for use by proxy servers
	like Squid-3.x etc. SquidClamav can be used for Anti-Virus scanning.
endef

CONFIGURE_ARGS += \
	--prefix=/usr \
	--enable-large-files

CONFIGURE_VARS += \
	ac_cv_fcntl=yes \
	ac_cv_10031b_ipc_sem=yes

define Package/c-icap/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/c-icap $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/c-icap-client $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/c-icap-config $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/c-icap-stretch $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/c-icap-libicapapi-config $(1)/usr/bin/


	$(INSTALL_DIR) $1/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/* $(1)/usr/include/

	$(INSTALL_DIR) $1/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/* $(1)/usr/lib/
	
	$(INSTALL_DIR) $1/etc/c-icap/
	$(CP) $(PKG_INSTALL_DIR)/etc/* $(1)/etc/c-icap/
endef

$(eval $(call BuildPackage,c-icap))
