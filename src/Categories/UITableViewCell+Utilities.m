//
//  UITableViewCell+Utilities.m
//
//  Created by Le Tien Dat on 8/25/25.
//

#import "UITableViewCell+Utilities.h"

@implementation UITableViewCell (Utilities)

+ (NSString *)reuseIdentifier {
    return NSStringFromClass(self);
}

@end