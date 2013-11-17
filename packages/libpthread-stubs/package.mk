# Source directory
LIBPTHREADS_STUBS_DIR      := libpthread-stubs

# Target
LIBPTHREADS_STUBS_TARGET   := $(ROOTFS_PATH)/usr/lib/pkgconfig/pthread-stubs.pc

# Rules
$(LIBPTHREADS_STUBS_TARGET):
	mkdir -p $(BUILD_PATH)/$(LIBPTHREADS_STUBS_DIR)
	cd $(BUILD_PATH)/$(LIBPTHREADS_STUBS_DIR) && $(SOURCES_PATH)/$(LIBPTHREADS_STUBS_DIR)/configure --prefix=$(ROOTFS_PATH)/usr
	cd $(BUILD_PATH)/$(LIBPTHREADS_STUBS_DIR) && make -j$(NB_THREADS)
	cd $(BUILD_PATH)/$(LIBPTHREADS_STUBS_DIR) && make install

# Add the target to the package target list
PACKAGE_TARGETS += $(LIBPTHREADS_STUBS_TARGET)
