#
# Copyright (C) 2011 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=perlbase-common-sense
PKG_VERSION:=3.74
PKG_RELEASE:=2
PKG_MD5SUM:=35b273147200c4c95eef7816f83e572d

PKG_SOURCE_URL:=http://search.cpan.org/CPAN/authors/id/M/ML/MLEHMANN
PKG_SOURCE:=common-sense-$(PKG_VERSION).tar.gz

PKG_BUILD_DIR:=$(BUILD_DIR)/perl/common-sense-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/../feeds/packages/lang/perl/perlmod.mk

define Package/perlbase-common-sense
	SUBMENU:=Perl
	SECTION:=lang
	CATEGORY:=Languages
	TITLE:=common::sense Module - customfeed
	URL:=http://search.cpan.org/~mlehmann/common-sense-3.73/sense.pod
	DEPENDS:=perl +perlbase-essential
endef

define Build/Configure
	$(call perlmod/Configure,,)
endef

define Build/Compile
	$(call perlmod/Compile,,)
endef

define Package/perlbase-common-sense/install
	$(call perlmod/Install,$(1),common auto/common)
endef

$(eval $(call BuildPackage,perlbase-common-sense))
