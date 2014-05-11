# Source directory
WESTON_DIR      := weston

# Target
WESTON_TARGET   := $(ROOTFS_PATH)/usr/bin/weston

# Rules
$(WESTON_TARGET):
	mkdir -p $(BUILD_PATH)/$(WESTON_DIR)
	cd $(BUILD_PATH)/$(WESTON_DIR); PATH=$(TOOLS_PATH)/bin:$(PATH) PKG_CONFIG_PATH=$(ROOTFS_PATH)/usr/lib/pkgconfig $(SOURCES_PATH)/$(WESTON_DIR)/autogen.sh --prefix=$(ROOTFS_PATH)/usr --host=$(TARGET) --target=$(TARGET)
	cd $(BUILD_PATH)/$(WESTON_DIR); PATH=$(TOOLS_PATH)/bin:$(PATH) make -j$(NB_THREADS)
	cd $(BUILD_PATH)/$(WESTON_DIR); PATH=$(TOOLS_PATH)/bin:$(PATH) make install

# Add the target to the package target list
PACKAGE_TARGETS += $(WESTON_TARGET)
