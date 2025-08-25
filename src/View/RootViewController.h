#import <UIKit/UIKit.h>
#import "../ViewModel/ViewModel.h"

@interface RootViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

- (instancetype)initWithViewModel:(ViewModel *)viewModel;

@end
