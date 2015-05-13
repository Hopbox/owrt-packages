#
# Copyright (C) 2010-2015 hopbox.in 
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-hopcloud
PKG_VERSION:=0.1
PKG_RELEASE:=1
PKG_MAINTAINER:=Nishant Sharma <codemarauder@gmail.com>
PKG_LICENSE:=GPLv2

include $(INCLUDE_DIR)/package.mk

define Package/luci-app-hopcloud
  SECTION:=LuCI
  CATEGORY:=LuCI
  SUBMENU:=3. Applications
  TITLE:=LuCI support for the HOPCLOUD central management cloud
  DEPENDS:=+hopcloud +luci-mod-admin-full +luci-lib-nixio
  PKGARCH:=all
  MAINTAINER:=Nishant Sharma <codemarauder@gmail.com>
endef

define Package/luci-app-hopcloud/description
LuCI frontend for HOPCLOUD centralised device management from the cloud.
HOPCLOUD is a freemium service provided by http://hopbox.in. This APP lets you
connect your device to the HOPCLOUD and initialise it for remote management.
endef

define Build/Compile
endef

define Package/luci-app-hopcloud/install
        $(CP) ./files/* $(1)
endef

$(eval $(call BuildPackage,luci-app-hopcloud))
