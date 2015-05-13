#
# Copyright (C) 2011 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=perlbase-types-serialiser
PKG_VERSION:=1.0
PKG_RELEASE:=1
PKG_MD5SUM:=76460a2bfbc644672499af89192e03fe

PKG_SOURCE_URL:=http://search.cpan.org/CPAN/authors/id/M/ML/MLEHMANN
PKG_SOURCE:=Types-Serialiser-$(PKG_VERSION).tar.gz

PKG_BUILD_DIR:=$(BUILD_DIR)/perl/Types-Serialiser-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/../feeds/packages/lang/perl/perlmod.mk

define Package/perlbase-types-serialiser
SUBMENU:=Perl
SECTION:=lang
CATEGORY:=Languages
TITLE:=Types::Serialiser Module - customfeed
URL:=http://search.cpan.org/~mlehmann/Types-Serialiser-$(PKG_VERSION)/Serialiser.pm
DEPENDS:=perl +perlbase-essential +perlbase-common-sense
endef

define Build/Configure
	$(call perlmod/Configure,,)
endef

define Build/Compile
	$(call perlmod/Compile,,)
endef

define Package/perlbase-types-serialiser/install
	$(call perlmod/Install,$(1),Types auto/Types)
endef

$(eval $(call BuildPackage,perlbase-types-serialiser))
