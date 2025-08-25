#import "RootViewController.h"
#import "../ViewModel/ViewModel.h"
#import "../Categories/UITableViewCell+Utilities.h"
#import "Cell/MyTableViewCell.h"

@interface RootViewController ()

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) ViewModel *viewModel;

@end

@implementation RootViewController

- (instancetype)initWithViewModel:(ViewModel *)viewModel {
    self = [super init];
    _viewModel = viewModel;
    return self;
}

- (void)loadView {
    [super loadView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupView];
}

- (void)setupView {
    self.title = @"All BundleID";
    self.view.backgroundColor = UIColor.whiteColor;

    _tableView = [[UITableView alloc] init];
    [_tableView registerClass:[MyTableViewCell self] forCellReuseIdentifier:MyTableViewCell.reuseIdentifier];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.delaysContentTouches = NO;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:_tableView];

    if (@available(iOS 11.0, *)) {
        [NSLayoutConstraint activateConstraints:@[
            [_tableView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor],
            [_tableView.leadingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leadingAnchor],
            [_tableView.trailingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.trailingAnchor],
            [_tableView.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor]
        ]];
    } else {
        [NSLayoutConstraint activateConstraints:@[
            [_tableView.topAnchor constraintEqualToAnchor:self.topLayoutGuide.topAnchor],
            [_tableView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor],
            [_tableView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor],
            [_tableView.bottomAnchor constraintEqualToAnchor:self.topLayoutGuide.bottomAnchor]
        ]];
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_viewModel numberOfApplicationsBySection:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyTableViewCell.reuseIdentifier forIndexPath:indexPath];

    Application *application = [_viewModel getObjectByIndexPath:indexPath];
    [cell setTitle:application.name 
       description:application.bundleID 
           iconApp:application.icon 
          lastCell:[self.viewModel numberOfApplicationsBySection:indexPath.section] - 1 == indexPath.row];

    cell.actionButtonTapped = ^{
        [self showOptions:application];
    };
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [_viewModel headerNameBySection:section];
}

- (void)showOptions:(Application *)application {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil 
                                                                             message:nil 
                                                                      preferredStyle:UIAlertControllerStyleActionSheet];

    UIAlertAction *actionCopyNameApp = [UIAlertAction actionWithTitle:@"Copy Name App" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self copyItem:application.name];
    }];
    UIAlertAction *actionCopyBundleIDApp = [UIAlertAction actionWithTitle:@"Copy BundleID App" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self copyItem:application.bundleID];
    }];
    UIAlertAction *actionCopyNameAndBundleIDApp = [UIAlertAction actionWithTitle:@"Copy Name + BundleID App" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self copyItem:[NSString stringWithFormat:@"%@ - %@", application.name, application.bundleID]];
    }];
    UIAlertAction *actionCancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];

    [alertController addAction:actionCopyNameApp];
    [alertController addAction:actionCopyBundleIDApp];
    [alertController addAction:actionCopyNameAndBundleIDApp];
    [alertController addAction:actionCancel];

    [self.navigationController presentViewController:alertController animated:YES completion:nil];
}

- (void)copyItem:(NSString *)item {
    UIPasteboard.generalPasteboard.string = item;
}

@end