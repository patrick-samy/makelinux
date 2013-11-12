# Common targets required by sub-makefiles
ROOTFS_TARGET        := $(ROOTFS_PATH)
BINUTILS_TARGET      := $(TOOLS_PATH)/bin/$(TARGET)-ld
CC_TARGET            := $(TOOLS_PATH)/bin/$(TARGET)-gcc
LINUX_HEADERS_TARGET := $(ROOTFS_PATH)/include/linux/version.h
LINUX_IMAGE_TARGET   := $(SOURCES_PATH)/$(LINUX_DIR)/arch/$(ARCH)/boot/uImage
