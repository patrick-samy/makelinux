$(ROOTFS_TARGET):
	cp -Rf $(SOURCES_PATH)/$(ROOTFS_DIR) $(ROOTFS_PATH)

.PHONY: clean-rootfs
clean-rootfs:
	rm -rf $(ROOTFS_PATH)

.PHONY: distclean-rootfs
distclean-rootfs:
	rm -rf $(SOURCES_PATH)/$(ROOTFS_DIR)
