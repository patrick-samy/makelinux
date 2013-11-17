# Source directory
WAYLAND_DIR      := wayland

# Target
WAYLAND_TARGET   := $(ROOTFS_PATH)/usr/lib/libwayland-server.so

# Rules
$(WAYLAND_TARGET):
	mkdir -p $(BUILD_PATH)/$(WAYLAND_DIR)
	cd $(BUILD_PATH)/$(WAYLAND_DIR); $(SOURCES_PATH)/$(WAYLAND_DIR)/configure
	cd $(BUILD_PATH)/$(WAYLAND_DIR); make -j$(NB_THREADS)
	cp $(BUILD_PATH)/$(WAYLAND_DIR)/src/wayland-scanner $(TOOLS_PATH)/bin/
	cd $(BUILD_PATH)/$(WAYLAND_DIR); make clean
	cd $(BUILD_PATH)/$(WAYLAND_DIR); PATH=$(TOOLS_PATH)/bin:$(PATH) PKG_CONFIG_PATH=$(ROOTFS_PATH)/usr/lib/pkgconfig $(SOURCES_PATH)/$(WAYLAND_DIR)/configure --prefix=$(ROOTFS_PATH)/usr --host=$(TARGET) --target=$(TARGET) --disable-scanner
	cd $(BUILD_PATH)/$(WAYLAND_DIR); PATH=$(TOOLS_PATH)/bin:$(PATH) make -j$(NB_THREADS)
	cd $(BUILD_PATH)/$(WAYLAND_DIR); PATH=$(TOOLS_PATH)/bin:$(PATH) make install

# Add the target to the package target list
PACKAGE_TARGETS += $(WAYLAND_TARGET)
