include $(THEOS)/makefiles/common.mk

export TARGET = iphone:clang:11.2:11.0
export ARCHS = arm64

BUNDLE_NAME = nocturnal
nocturnal_BUNDLE_EXTENSION = bundle
nocturnal_FILES = nocturnal.m
nocturnal_PRIVATE_FRAMEWORKS = ControlCenterUIKit
nocturnal_INSTALL_PATH = /Library/ControlCenter/Bundles/

after-install::
	install.exec "killall -9 SpringBoard"

include $(THEOS_MAKE_PATH)/bundle.mk
