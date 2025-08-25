//
//  UIColor+Hex.h
//
//  Created by Le Tien Dat on 8/25/25.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (Hex)

+ (UIColor *)colorWithHex:(uint32_t)hex;
+ (UIColor *)colorWithHex:(uint32_t)hex alpha:(CGFloat)alpha;

@end

NS_ASSUME_NONNULL_END