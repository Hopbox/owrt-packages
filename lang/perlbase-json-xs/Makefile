#
# Copyright (C) 2011 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=perlbase-json-xs
PKG_VERSION:=3.01
PKG_RELEASE:=1
PKG_MD5SUM:=b7be65295baf6dd9233c6494782c1153

PKG_SOURCE_URL:=http://search.cpan.org/CPAN/authors/id/M/ML/MLEHMANN
PKG_SOURCE:=JSON-XS-$(PKG_VERSION).tar.gz

PKG_BUILD_DIR:=$(BUILD_DIR)/perl/JSON-XS-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/../feeds/packages/lang/perl/perlmod.mk

define Package/perlbase-json-xs
SUBMENU:=Perl
SECTION:=lang
CATEGORY:=Languages
TITLE:=JSON::XS Module - customfeed
URL:=http://search.cpan.org/~mlehmann/JSON-XS-3.01/XS.pm
DEPENDS:=perl +perlbase-types-serialiser +perlbase-xsloader +perlbase-attributes
endef

define Build/Configure
	$(call perlmod/Configure,,)
endef

define Build/Compile
	$(call perlmod/Compile,,)
endef

define Package/perlbase-json-xs/install
	$(call perlmod/Install,$(1),JSON auto/JSON)
endef

$(eval $(call BuildPackage,perlbase-json-xs))
