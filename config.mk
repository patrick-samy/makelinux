# Toolchain
TARGET          := arm-hackboard-linux-gnueabihf
ARCH            := arm
ARCH_VARIANT    := v7-a
FLOAT_TYPE      := hard
FPU_TYPE        := vfp

# Linux configuration
LINUX_DEFCONFIG := omap4plus_defconfig
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
