# Source directory
ICU_DIR      := icu/source

# Target
ICU_TARGET   := $(ROOTFS_PATH)/usr/lib/libicudata.so

# Rules
$(ICU_TARGET):
	mkdir -p $(BUILD_PATH)/$(ICU_DIR)/host
	cd $(BUILD_PATH)/$(ICU_DIR)/host; CXX=g++ $(SOURCES_PATH)/$(ICU_DIR)/runConfigureICU Linux --prefix=$(BUILD_PATH)/$(ICU_DIR)/host
	cd $(BUILD_PATH)/$(ICU_DIR)/host; make -j$(NB_THREADS)
	cd $(BUILD_PATH)/$(ICU_DIR); PATH=$(TOOLS_PATH)/bin:$(PATH) PKG_CONFIG_PATH=$(ROOTFS_PATH)/usr/lib/pkgconfig $(SOURCES_PATH)/$(ICU_DIR)/configure --prefix=$(ROOTFS_PATH)/usr --host=$(TARGET) --target=$(TARGET) --with-cross-build=$(BUILD_PATH)/$(ICU_DIR)/host
	cd $(BUILD_PATH)/$(ICU_DIR); PATH=$(TOOLS_PATH)/bin:$(PATH) make -j$(NB_THREADS)
	cd $(BUILD_PATH)/$(ICU_DIR); PATH=$(TOOLS_PATH)/bin:$(PATH) make install

# Add the target to the package target list
PACKAGE_TARGETS += $(ICU_TARGET)
