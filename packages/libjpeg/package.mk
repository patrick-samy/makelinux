# Source directory
LIBJPEG_DIR     := libjpeg

# Target
LIBJPEG_TARGET  := $(ROOTFS_PATH)/usr/lib/libjpeg.so

# Rules
$(LIBJPEG_TARGET):
	mkdir -p $(BUILD_PATH)/$(LIBJPEG_DIR)
	cd $(BUILD_PATH)/$(LIBJPEG_DIR); PATH=$(TOOLS_PATH)/bin:$(PATH) PKG_CONFIG_PATH=$(ROOTFS_PATH)/usr/lib/pkgconfig $(SOURCES_PATH)/$(LIBJPEG_DIR)/configure --prefix=$(ROOTFS_PATH)/usr --host=$(TARGET) --target=$(TARGET)
	cd $(BUILD_PATH)/$(LIBJPEG_DIR); PATH=$(TOOLS_PATH)/bin:$(PATH) make -j$(NB_THREADS)
	cd $(BUILD_PATH)/$(LIBJPEG_DIR); PATH=$(TOOLS_PATH)/bin:$(PATH) make install

# Add the target to the package target list
PACKAGE_TARGETS += $(LIBJPEG_TARGET)
