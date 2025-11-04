TOPDIR := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))

# Setup some required directories
ACU6_PRO_SDKDIR ?= $(realpath $(dir $(lastword $(sort $(wildcard ${TOPDIR}/sdk/*/Makefile)))))

export DEMOS := 1 # Include demo applications from the ACU6 SDK
export DEFCONFIG := myproj_defconfig

export BUILDROOT_OUTPUT := $(TOPDIR)/output
export ACTIA_USER_KEYSTORE_FILE := $(wildcard $(TOPDIR)/files/*keystore*.bpak)
export ACTIA_USER_SIGN_SCRIPT := $(TOPDIR)/files/sign.sh
export MAINTENANCE_PASSWORD := $(shell cat $(TOPDIR)/files/device-password.txt)
export USER_PRODUCT_NUMBER := $(shell cat $(TOPDIR)/files/user-product-number.txt)
export USER_SOFTWARE_VERSION := $(shell cat $(TOPDIR)/files/user-software-version.txt)

export BR2_EXTERNAL=$(TOPDIR)/externals/myproj

MAKEARGS := -C $(ACU6_PRO_SDKDIR) --no-print-directory

.PHONY: _all $(MAKECMDGOALS)

all	:= $(filter-out Makefile,$(MAKECMDGOALS))

_all:
	@$(MAKE) $(MAKEFLAGS) $(MAKEARGS) $(all)

$(all): _all
	@:
