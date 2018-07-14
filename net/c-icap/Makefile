#
# Copyright (C) 2018 Unmukti Technology Pvt Ltd - unmukti.in
# 
# This is a free software, licensed under GNU General Public License v3.
# See /LICENSE for more information.
#
# Includes content from github repository of @hongkongkiwi 
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
PKG_FIXUP:=autoreconf

include $(INCLUDE_DIR)/package.mk

define Package/libicapapi/Default
	URL:=http://c-icap.sourceforge.net/
	DEPENDS:=+libc +libpcre +libpthread +librt +zlib +libbz2
endef

define Package/libicapapi
	$(call Package/libicapapi/Default)
	SECTION:=libs
	CATEGORY:=Libraries
	TITLE:=ICAP API Library for C-ICAP Server
endef

define Package/c-icap
	SECTION:=net
	CATEGORY:=Network
	SUBMENU:=Web Servers/Proxies
	DEPENDS:=+libicapapi
	TITLE:=ICAP server for squid, clamav etc
	URL:=http://c-icap.sourceforge.net/
endef

define Package/c-icap/description
	c-icap server implements the ICAP protocol for use by proxy servers
	like Squid-3.x etc for content adaptation and filtering.
endef

CONFIGURE_ARGS += \
	--prefix=/usr \
	--enable-large-files

CONFIGURE_VARS += \
	ac_cv_fcntl=yes \
	ac_cv_10031b_ipc_sem=yes

define Build/Prepare
	$(call Build/Prepare/Default)
	echo $(PKG_VERSION) > $(PKG_BUILD_DIR)/VERSION.m4
endef

define Build/InstallDev
	$(INSTALL_DIR) $(2)/bin $(1)/usr/bin $(1)/usr/lib $(1)/usr/include
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/c-icap-config $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/c-icap-libicapapi-config $(1)/usr/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/c_icap $(1)/usr/lib
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/lib/libicapapi.{la,so*} $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/include/c_icap $(1)/usr/include
	$(SED) 's,^INCDIR=/usr/include,INCDIR=$(STAGING_DIR)/usr/include,g' $(1)/usr/bin/c-icap-config
	$(SED) 's,^INCDIR2=/usr/include/c_icap,INCDIR2=$(STAGING_DIR)/usr/include/c_icap,g' $(1)/usr/bin/c-icap-config
	$(SED) 's,^INCDIR=/usr/include,INCDIR=$(STAGING_DIR)/usr/include,g' $(1)/usr/bin/c-icap-libicapapi-config
	$(SED) 's,^INCDIR2=/usr/include/c_icap,INCDIR2=$(STAGING_DIR)/usr/include/c_icap,g' $(1)/usr/bin/c-icap-libicapapi-config
	ln -sf $(STAGING_DIR)/usr/bin/c-icap-config $(2)/bin/
	ln -sf $(STAGING_DIR)/usr/bin/c-icap-libicapapi-config $(2)/bin/
endef

define Package/libicapapi/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/lib/libicapapi.so* $(1)/usr/lib/
	$(INSTALL_DIR) $(1)/usr/lib/c_icap
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/lib/c_icap/* $(1)/usr/lib/c_icap
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/* $(1)/usr/bin/
	#$(INSTALL_DIR) $(1)/etc/config
	#$(INSTALL_DATA) $(PKG_BUILD_DIR)/c-icap.conf $(1)/etc/config
endef

$(eval $(call BuildPackage,libicapapi))
$(eval $(call BuildPackage,c-icap))
