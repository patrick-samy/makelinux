# Global variables
ROOT_DIR   := $(CURDIR)

# Set the number of threads to the CPU number + 1
NB_THREADS ?= $(shell echo $(shell grep -c processor /proc/cpuinfo) + 1 | bc)

# Include configuration sub-makefile
include config.mk

# Include configuration sub-makefile for packages
include packages/config.mk

# Include common targets
include mk/common.mk

# Main rules
.PHONY: all
all: $(LINUX_IMAGE_TARGET) packages

.PHONY: install
install: all

.PHONY: clean
clean: clean-rootfs clean-toolchain clean-linux

.PHONY: distclean
distclean: clean distclean-rootfs distclean-toolchain distclean-linux
	rm -rf $(SOURCES_PATH)

# Include sub-makefiles
include mk/rootfs.mk
include mk/toolchain.mk
include mk/linux.mk
include mk/packages.mk
