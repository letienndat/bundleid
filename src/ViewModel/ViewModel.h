//
//  ViewModel.h
//
//  Created by Le Tien Dat on 8/22/25.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "../Model/Application.h"

@interface ViewModel : NSObject

@property (nonatomic, strong, readonly) NSMutableArray<Application *> *apps;
@property (nonatomic, strong, readonly) NSMutableArray<Application *> *appsUser;
@property (nonatomic, strong, readonly) NSMutableArray<Application *> *appsSystem;

- (NSUInteger)numberOfApplicationsBySection:(NSUInteger)section;
- (NSString *)headerNameBySection:(NSUInteger)section;
- (Application *)getObjectByBundleID:(NSString *)bundleID;
- (Application *)getObjectByIndexPath:(NSIndexPath *)indexPath;

@end