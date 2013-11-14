# Source directory
OMAP4_PVR_DKMS_SOURCE_PATH := $(SOURCES_PATH)/pvr-omap4-dkms/git-import-orig
OMAP4_PVR_DKMS_BUILD_PATH  := $(OMAP4_PVR_DKMS_SOURCE_PATH)/sgx/eurasiacon/build/linux2/omap4430_linux

# Target
OMAP4_PVR_DKMS_TARGET     := $(ROOTFS_PATH)/lib/modules/$(LINUX_VERSION)/kernel/extra/omapdrm_pvr.ko

# Rules
$(OMAP4_PVR_DKMS_TARGET):
	cd $(OMAP4_PVR_DKMS_SOURCE_PATH) && patch -N -p1 < $(ROOT_DIR)/packages/omap4-pvr-dkms/uninitialized-variables.patch || true
	KERNELDIR=$(SOURCES_PATH)/$(LINUX_DIR) make -j$(NB_THREADS) -C$(OMAP4_PVR_DKMS_BUILD_PATH) ARCH=$(ARCH) CROSS_COMPILE=$(TOOLS_PATH)/bin/$(TARGET)-
	cp $(OMAP4_PVR_DKMS_SOURCE_PATH)/sgx/eurasiacon/binary2_omap4430_linux_release/target/omapdrm_pvr.ko $(OMAP4_PVR_DKMS_TARGET)

# Add the target to the package target list
PACKAGE_TARGETS           += $(OMAP4_PVR_DKMS_TARGET)
