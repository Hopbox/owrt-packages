#
# Copyright (C) 2011 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=perlbase-string-crc32
PKG_VERSION:=1.7
PKG_RELEASE:=1
PKG_MD5SUM:=795a7c23fae9d24e485d4de08a58ef03

PKG_SOURCE_URL:=https://cpan.metacpan.org/authors/id/L/LE/LEEJO/
PKG_SOURCE:=String-CRC32-$(PKG_VERSION).tar.gz

PKG_BUILD_DIR:=$(BUILD_DIR)/perl/String-CRC32-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/../feeds/packages/lang/perl/perlmod.mk

define Package/perlbase-string-crc32
SUBMENU:=Perl
SECTION:=lang
CATEGORY:=Languages
TITLE:=String::CRC32 Module - customfeed
URL:=https://metacpan.org/pod/String::CRC32
DEPENDS:=perl +perlbase-xsloader
endef

define Build/Configure
	$(call perlmod/Configure,,)
endef

define Build/Compile
	$(call perlmod/Compile,,)
endef

define Package/perlbase-string-crc32/install
	$(call perlmod/Install,$(1),String auto/String)
endef

$(eval $(call BuildPackage,perlbase-string-crc32))
