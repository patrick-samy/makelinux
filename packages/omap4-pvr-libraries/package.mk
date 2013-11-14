# Source directory
OMAP4_PVR_LIBRARIES_SOURCE_PATH := $(SOURCES_PATH)/pvr-omap4/

# Target
OMAP4_PVR_LIBRARIES_TARGET     := $(ROOTFS_PATH)/usr/bin/pvrsrvinit

# Rules
$(OMAP4_PVR_LIBRARIES_TARGET):
	cp -R $(OMAP4_PVR_LIBRARIES_SOURCE_PATH)/usr $(ROOTFS_PATH)/

# Add the target to the package target list
PACKAGE_TARGETS                += $(OMAP4_PVR_LIBRARIES_TARGET)
