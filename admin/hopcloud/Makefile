#
# Copyright (C) 2010-2015 hopbox.in 
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=hopcloud
PKG_VERSION:=0.2
PKG_RELEASE:=1
PKG_MAINTAINER:=Nishant Sharma <codemarauder@gmail.com>
PKG_LICENSE:=GPLv2

include $(INCLUDE_DIR)/package.mk

define Package/hopcloud
  SECTION:=admin
  CATEGORY:=Administration
  TITLE:=HOPCLOUD central management system
  DEPENDS:=+perlbase-json-xs +curl
  PKGARCH:=all
  MAINTAINER:=Nishant Sharma <codemarauder@gmail.com>
endef

define Package/hopcloud/description
HOPCLOUD is a freemium service provided by http://hopbox.in. This package selects
the LuCI app luci-app-hopcloud by-default as it needs the GUI to initialise the 
device. More info at http://hopbox.in.
endef

define Build/Compile
endef

define Package/hopcloud/install
        $(CP) ./files/* $(1)
endef

$(eval $(call BuildPackage,hopcloud))
