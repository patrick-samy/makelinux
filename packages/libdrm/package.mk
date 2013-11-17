# Source directory
LIBDRM_DIR      := libdrm

# Target
LIBDRM_TARGET   := $(ROOTFS_PATH)/usr/lib/libdrm.so

# Rules
$(LIBDRM_TARGET):
	cd $(SOURCES_PATH)/$(LIBDRM_DIR); patch -N -p1 < $(ROOT_DIR)/packages/$(LIBDRM_DIR)/no-cairo.patch; autoreconf -i
	mkdir -p $(BUILD_PATH)/$(LIBDRM_DIR)
	cd $(BUILD_PATH)/$(LIBDRM_DIR); PATH=$(TOOLS_PATH)/bin:$(PATH) PKG_CONFIG_PATH=$(ROOTFS_PATH)/usr/lib/pkgconfig $(SOURCES_PATH)/$(LIBDRM_DIR)/configure --prefix=$(ROOTFS_PATH)/usr --host=$(TARGET) --target=$(TARGET) --disable-cairo --disable-intel --disable-radeon --disable-nouveau --enable-omap-experimental-api
	cd $(BUILD_PATH)/$(LIBDRM_DIR); PATH=$(TOOLS_PATH)/bin:$(PATH) make -j$(NB_THREADS)
	cd $(BUILD_PATH)/$(LIBDRM_DIR); PATH=$(TOOLS_PATH)/bin:$(PATH) make install

# Add the target to the package target list
PACKAGE_TARGETS += $(LIBDRM_TARGET)
