# Source directory
REFLEXIO_DIR      := reflexio

# Target
REFLEXIO_TARGET   := $(ROOTFS_PATH)/usr/bin/reflexio

# Rules
$(REFLEXIO_TARGET):
	mkdir -p $(BUILD_PATH)/$(REFLEXIO_DIR)
	cd $(SOURCES_PATH)/$(REFLEXIO_DIR) && PATH=$(TOOLS_PATH)/bin:$(PATH) CXX=$(TARGET)-g++ CPPFLAGS=$(ROOTFS_PATH)/usr/include/ LDFLAGS=-L$(ROOTFS_PATH)/usr/lib make
	cp $(SOURCES_PATH)/$(REFLEXIO_DIR)/reflexio $(ROOTFS_PATH)/usr/bin/reflexio

# Add the target to the package target list
PACKAGE_TARGETS += $(REFLEXIO_TARGET)
