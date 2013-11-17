# Source directory
LIBGBM_SOURCE_PATH := $(SOURCES_PATH)/pvr-omap4

# Target
LIBGBM_TARGET     := $(ROOTFS_PATH)/usr/bin/pvrsrvinit

# Rules
$(LIBGBM_TARGET):

# Add the target to the package target list
PACKAGE_TARGETS                += $(LIBGBM_TARGET)
