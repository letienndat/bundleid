//
//  Application.h
//
//  Created by Le Tien Dat on 8/22/25.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Application : NSObject

@property (readonly, nonatomic) NSString *name;
@property (readonly, nonatomic) NSString *bundleID;
@property (readonly, nonatomic) UIImage *icon;
@property (readonly, nonatomic) NSString *applicationType;

- (instancetype)initWithName:(NSString *)name bundleID:(NSString *)bundleID icon:(UIImage *)icon applicationType:(NSString *)applicationType;

@end