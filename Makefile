export THEOS_DEVICE_IP = localhost-iphone
# export THEOS_DEVICE_USER = root
# export THEOS_DEVICE_PASSWORD = alpine
ARCHS = arm64 arm64e
INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

APPLICATION_NAME = BundleID

BundleID_FILES = main.m AppDelegate.m src/View/RootViewController.m src/Model/Application.m src/ViewModel/ViewModel.x src/View/Cell/MyTableViewCell.m src/Categories/UIColor+Hex.m src/Categories/UITableViewCell+Utilities.m src/Const/AppConst.m
BundleID_FRAMEWORKS = UIKit CoreGraphics Foundation CoreServices
BundleID_CFLAGS = -fobjc-arc
BundleID_RESOURCE_DIRS = Resources

THEOS_EXTRA_FRAMEWORKS += AppList

include $(THEOS_MAKE_PATH)/application.mk