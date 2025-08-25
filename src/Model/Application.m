//
//  Application.m
//
//  Created by Le Tien Dat on 8/22/25.
//

#import "Application.h"

@implementation Application

- (instancetype)initWithName:(NSString *)name bundleID:(NSString *)bundleID icon:(UIImage *)icon applicationType:(NSString *)applicationType {
    self = [super init];
    
    if (self) {
        _name = name;
        _bundleID = bundleID;
        _icon = icon;
        _applicationType = applicationType;
    }
    
    return self;
}

@end