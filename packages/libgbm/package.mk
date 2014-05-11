# Source directory
LIBGBM_DIR := libgbm

# Target
LIBGBM_TARGET     := $(ROOTFS_PATH)/usr/lib/libgbm.so

# Rules
$(LIBGBM_TARGET):
	mkdir -p $(BUILD_PATH)/$(LIBGBM_DIR)
	cd $(BUILD_PATH)/$(LIBGBM_DIR); PATH=$(TOOLS_PATH)/bin:$(PATH) PKG_CONFIG_PATH=$(ROOTFS_PATH)/usr/lib/pkgconfig $(SOURCES_PATH)/$(LIBGBM_DIR)/autogen.sh --prefix=$(ROOTFS_PATH) --host=$(TARGET) --target=$(TARGET)
	cd $(BUILD_PATH)/$(LIBGBM_DIR); PATH=$(TOOLS_PATH)/bin:$(PATH) make -j$(NB_THREADS)
	cd $(BUILD_PATH)/$(LIBGBM_DIR); PATH=$(TOOLS_PATH)/bin:$(PATH) make install

# Add the target to the package target list
PACKAGE_TARGETS    += $(LIBGBM_TARGET)
