export THEOS=/opt/theos

GO_EASY_ON_ME = 1
THEOS_DEVICE_IP = 192.168.1.126

TARGET = iphone:clang:11.2:11.0
ARCHS = arm64 arm64e

BUNDLE_NAME = nocturnal
$(BUNDLE_NAME)_BUNDLE_EXTENSION = bundle
$(BUNDLE_NAME)_FILES = nocturnal.m
$(BUNDLE_NAME)_CFLAGS +=  -fobjc-arc -I$(THEOS_PROJECT_DIR)/headers
$(BUNDLE_NAME)_LDFLAGS += $(THEOS_PROJECT_DIR)/Frameworks/ControlCenterUIKit.tbd
$(BUNDLE_NAME)_INSTALL_PATH = /Library/ControlCenter/Bundles/

# $(BUNDLE_NAME)_PRIVATE_FRAMEWORKS = ControlCenterUIKit

include $(THEOS)/makefiles/common.mk
include $(THEOS_MAKE_PATH)/bundle.mk

after-install::
	install.exec "killall -9 SpringBoard"
