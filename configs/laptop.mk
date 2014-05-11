# Toolchain
TARGET          := i386-hackstation-linux-gnu
ARCH            := i386

# Linux configuration
LINUX_DEFCONFIG := localmodconfig
LINUX_LOADADDR  := 80300000
LINUX_VERSION   := 4_3.4.0-TI

# Main directories
SOURCES_PATH    := $(ROOT_DIR)/sources
BUILD_PATH      := $(ROOT_DIR)/build
ROOTFS_PATH     := $(ROOT_DIR)/rootfs
TOOLS_PATH      := $(ROOT_DIR)/tools

# Sub-directories
BINUTILS_DIR    := binutils
CC_DIR          := gcc
LINUX_DIR       := linux/kernel-tilt
ROOTFS_DIR      := rootfs

# Package list
PACKAGES        :=
