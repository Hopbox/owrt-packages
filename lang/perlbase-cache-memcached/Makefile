#
# Copyright (C) 2011 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=perlbase-cache-memcached
PKG_VERSION:=1.30
PKG_RELEASE:=1
PKG_MD5SUM:=6f87a85c8dee38fb9ebf1df56cb07f7b

PKG_SOURCE_URL:=https://cpan.metacpan.org/authors/id/D/DO/DORMANDO/
PKG_SOURCE:=Cache-Memcached-$(PKG_VERSION).tar.gz

PKG_BUILD_DIR:=$(BUILD_DIR)/perl/Cache-Memcached-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/../feeds/packages/lang/perl/perlmod.mk

define Package/perlbase-cache-memcached
SUBMENU:=Perl
SECTION:=lang
CATEGORY:=Languages
TITLE:=Cache::Memcached Module - customfeed
URL:=https://metacpan.org/pod/Cache::Memcached
DEPENDS:=perl +perlbase-xsloader +perlbase-string-crc32 +perlbase-storable +perlbase-time +perlbase-integer +perlbase-encode +perlbase-fields +perlbase-hash
endef

define Build/Configure
	$(call perlmod/Configure,,)
endef

define Build/Compile
	$(call perlmod/Compile,,)
endef

define Package/perlbase-cache-memcached/install
	$(call perlmod/Install,$(1),Cache auto/Cache)
endef

$(eval $(call BuildPackage,perlbase-cache-memcached))
