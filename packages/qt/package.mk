# Source directory
QT_DIR      := qt

# Target
QT_TARGET   := $(ROOTFS_PATH)/usr/lib/libQt5Core.so

# Rules
$(QT_TARGET):
	mkdir -p $(SOURCES_PATH)/qt/qtbase/mkspecs/$(TARGET)-g++
	cp $(ROOT_DIR)/packages/qt/$(TARGET)-g++/qmake.conf $(SOURCES_PATH)/qt/qtbase/mkspecs/$(TARGET)-g++/
	cp $(ROOT_DIR)/packages/qt/$(TARGET)-g++/qplatformdefs.h $(SOURCES_PATH)/qt/qtbase/mkspecs/$(TARGET)-g++/
	mkdir -p $(BUILD_PATH)/$(QT_DIR)
	cd $(BUILD_PATH)/$(QT_DIR) && PKG_CONFIG_PATH=$(ROOTFS_PATH)/usr/lib/pkgconfig PKG_CONFIG_LIBDIR=$(ROOTFS_PATH)/usr/lib PKG_CONFIG_SYSROOT_DIR=$(ROOTFS_PATH) PATH=$(TOOLS_PATH)/bin:$(PATH) $(SOURCES_PATH)/$(QT_DIR)/configure -prefix $(ROOTFS_PATH)/usr -release -confirm-license -opensource -make libs -xplatform $(TARGET)-g++ -eglfs -opengl es2 -no-xcb -no-wayland -icu
	cd $(BUILD_PATH)/$(QT_DIR) && PATH=$(TOOLS_PATH)/bin:$(PATH) make -j$(NB_THREADS)
	cd $(BUILD_PATH)/$(QT_DIR) && PATH=$(TOOLS_PATH)/bin:$(PATH) make install

# Add the target to the package target list
PACKAGE_TARGETS += $(QT_TARGET)
