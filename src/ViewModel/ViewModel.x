//
//  ViewModel.m
//
//  Created by Le Tien Dat on 8/22/25.
//

#import "ViewModel.h"
#import "../Model/Application.h"
#import <AppList/AppList.h>

// MARK: Declares interface

// LSApplicationWorkspace
@interface LSApplicationWorkspace : NSObject

+ (id)defaultWorkspace;
- (id)allApplications;

@end

// LSApplicationProxy
@interface LSApplicationProxy

@property (readonly, nonatomic) NSString *applicationIdentifier;
@property (readonly, nonatomic) NSString *applicationType;

- (id)localizedNameForContext:(id)a0;
- (id)iconDataForVariant:(int)variant withOptions:(int)options;
- (id)iconDataForVariant:(int)a0;

@end

// MARK: Implement interface

typedef NS_ENUM(NSUInteger, RowType) {
    rUser = 0,
    rSystem = 1
};

@interface ViewModel ()

@end

@implementation ViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        _apps = [NSMutableArray new];
        NSArray<LSApplicationProxy *> *applicationWorkspaces = [[%c(LSApplicationWorkspace) defaultWorkspace] allApplications];

        for (LSApplicationProxy *appProxy in applicationWorkspaces) {ALApplicationList *applicationList = [ALApplicationList sharedApplicationList];
            UIImage *iconApp = [applicationList iconOfSize:ALApplicationIconSizeLarge forDisplayIdentifier:appProxy.applicationIdentifier];

            Application *app = [[Application alloc] initWithName:[[NSString alloc] initWithFormat:@"%@", [appProxy localizedNameForContext:nil]]
                                                        bundleID:appProxy.applicationIdentifier
                                                            icon:iconApp
                                                 applicationType:appProxy.applicationType];
            [_apps addObject:app];
        }
        
        NSPredicate *predicateAppsUser = [NSPredicate predicateWithFormat:@"applicationType == %@", @"User"];
        _appsUser = [NSMutableArray arrayWithArray:[_apps filteredArrayUsingPredicate:predicateAppsUser]];

        NSPredicate *predicateAppsSystem = [NSPredicate predicateWithFormat:@"applicationType == %@", @"System"];
        _appsSystem = [NSMutableArray arrayWithArray:[_apps filteredArrayUsingPredicate:predicateAppsSystem]];
    }

    return self;
}

- (NSUInteger)numberOfApplicationsBySection:(NSUInteger)section {
    RowType rowType = (RowType)section;

    switch (rowType) {
        case rUser:
            return _appsUser.count;
        case rSystem:
            return _appsSystem.count;
    }
}

- (NSString *)headerNameBySection:(NSUInteger)section {
    RowType rowType = (RowType)section;

    switch (rowType) {
        case rUser:
            return @"Apps User";
        case rSystem:
            return @"Apps System";
    }
}

- (Application *)getObjectByBundleID:(NSString *)bundleID {
    Application *application = nil;

    for (Application *app in _apps) {
        if (app.bundleID == bundleID) {
            application = app;
            break;
        }
    }

    return application;
}

- (Application *)getObjectByIndexPath:(NSIndexPath *)indexPath {
    RowType rowType = (RowType)indexPath.section;

    switch (rowType) {
        case rUser:
            return _appsUser[indexPath.row];
        case rSystem:
            return _appsSystem[indexPath.row];
    }
}

@end
