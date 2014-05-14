# Toolchain
TARGET           := i386-hackstation-linux-gnu
ARCH             := i386

# Linux configuration
LINUX_DEFCONFIG  := i386_defconfig
LINUX_VERSION    := 3.14.3-1-ARCH
LINUX_IMAGE_TYPE := bzImage

# Main directories
SOURCES_PATH     := $(ROOT_DIR)/sources
BUILD_PATH       := $(ROOT_DIR)/build
ROOTFS_PATH      := $(ROOT_DIR)/rootfs
TOOLS_PATH       := $(ROOT_DIR)/tools

# Sub-directories
BINUTILS_DIR     := binutils
CC_DIR           := gcc
LINUX_DIR        := linux
ROOTFS_DIR       := rootfs

# Package list
PACKAGES         :=
