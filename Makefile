# Global variables
ROOT_DIR   := $(CURDIR)

# Set the number of threads to the CPU number + 1
NB_THREADS ?= $(shell echo $(shell grep processor /proc/cpuinfo | wc -l) + 1 | bc)

# Include configure generated sub-makefile
ifeq (,$(wildcard configure.mk))
    $(error "Generated configure.mk seems to be missing, please run the configure script.")
endif

include configure.mk

# Include common targets
include mk/common.mk

# Main rules
.PHONY: all
all: $(LINUX_IMAGE_TARGET)

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
include packages/list.mk
