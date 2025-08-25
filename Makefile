export THEOS_DEVICE_IP = 172.17.3.79
export THEOS_DEVICE_USER = root
export THEOS_DEVICE_PASSWORD = alpine
ARCHS = arm64 arm64e
INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

APPLICATION_NAME = ListBundleID

ListBundleID_FILES = main.m AppDelegate.m src/View/RootViewController.m src/Model/Application.m src/ViewModel/ViewModel.x src/View/Cell/MyTableViewCell.m src/Categories/UIColor+Hex.m src/Categories/UITableViewCell+Utilities.m
ListBundleID_FRAMEWORKS = UIKit CoreGraphics Foundation CoreServices
ListBundleID_CFLAGS = -fobjc-arc
ListBundleID_RESOURCE_DIRS = Resources

include $(THEOS_MAKE_PATH)/application.mk