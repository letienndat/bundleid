#import "AppDelegate.h"
#import "src/View/RootViewController.h"
#import "src/ViewModel/ViewModel.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	_window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];

	ViewModel *viewModel = [[ViewModel alloc] init];
	RootViewController *vc = [[RootViewController alloc] initWithViewModel:viewModel];
	_rootViewController = [[UINavigationController alloc] initWithRootViewController:vc];
	_window.rootViewController = _rootViewController;
	[_window makeKeyAndVisible];
	return YES;
}

@end
