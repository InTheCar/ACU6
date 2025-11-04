################################################################################
#
# hello-acu6
#
################################################################################

HELLO_ACU6_VERSION = 0.1
HELLO_ACU6_SITE = $(HELLO_ACU6_PKGDIR)/files
HELLO_ACU6_SITE_METHOD = local
HELLO_ACU6_LICENSE = Actia Software License Agreement
HELLO_ACU6_LICENSE_FILES = EULA COPYING
HELLO_ACU6_REDISTRIBUTE = NO
HELLO_ACU6_INSTALL_TARGET = YES
HELLO_ACU6_DEPENDENCIES =

define HELLO_ACU6_BUILD_CMDS
    $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $ $(@D)
endef

define HELLO_ACU6_INSTALL_TARGET_CMDS
    $(MAKE) -C $(@D) install DESTDIR=$(TARGET_DIR) PREFIX=/usr
endef

$(eval $(generic-package))
