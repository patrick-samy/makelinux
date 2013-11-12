# Rules
$(BINUTILS_TARGET): $(ROOTFS_TARGET)
	mkdir -p $(BUILD_PATH)/$(BINUTILS_DIR)
	cd $(BUILD_PATH)/$(BINUTILS_DIR) && $(SOURCES_PATH)/$(BINUTILS_DIR)/configure --prefix=$(TOOLS_PATH) --target=$(TARGET) --with-sysroot=$(ROOTFS_PATH)
	cd $(BUILD_PATH)/$(BINUTILS_DIR) && make -j$(NB_THREADS)
	cd $(BUILD_PATH)/$(BINUTILS_DIR) && make -j$(NB_THREADS) install

$(CC_TARGET): $(ROOTFS_TARGET) $(BINUTILS_TARGET) $(LINUX_HEADERS_TARGET)
	mkdir -p $(BUILD_PATH)/$(CC_DIR) > /dev/null
	cd $(BUILD_PATH)/$(CC_DIR) && PATH=$(TOOLS_PATH)/bin:$(PATH) LD_LIBRARY_PATH=$(ROOTFS_PATH)/lib $(SOURCES_PATH)/$(CC_DIR)/configure --prefix=$(TOOLS_PATH) --target=$(TARGET) --with-sysroot=$(ROOTFS_PATH) --enable-languages=c,c++ --enable-shared --disable-bootstrap --disable-multilib --with-mode=$(ARCH) --with-arch=$(ARCH)$(ARCH_VARIANT) --with-float=$(FLOAT_TYPE) --with-fpu=$(FPU_TYPE) > /dev/null
	cd $(BUILD_PATH)/$(CC_DIR) && PATH=$(TOOLS_PATH)/bin:$(PATH) LD_LIBRARY_PATH=$(ROOTFS_PATH)/lib make -j$(NB_THREADS) AS_FOR_TARGET="$(TARGET)-as" LD_FOR_TARGET="$(TARGET)-ld" > /dev/null
	cd $(BUILD_PATH)/$(CC_DIR) && make install > /dev/null

.PHONY: clean-toolchain
clean-toolchain:
	rm -rf $(BUILD_PATH)/$(BINUTILS_DIR)
	rm -rf $(BUILD_PATH)/$(CC_DIR)
	rm -rf $(TOOLS_PATH)

.PHONY: distclean-toolchain
distclean-toolchain:
	rm -rf $(SOURCES_PATH)/$(BINUTILS_DIR)
	rm -rf $(SOURCES_PATH)/$(CC_DIR)
