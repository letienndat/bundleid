//
//  UIColor+Hex.m
//
//  Created by Le Tien Dat on 8/25/25.
//

#import "UIColor+Hex.h"

@implementation UIColor (Hex)

+ (UIColor *)colorWithHex:(uint32_t)hex {
    return [self colorWithHex:hex alpha:1.0];
}

+ (UIColor *)colorWithHex:(uint32_t)hex alpha:(CGFloat)alpha {
    CGFloat red   = ((hex & 0xFF0000) >> 16) / 255.0;
    CGFloat green = ((hex & 0x00FF00) >> 8)  / 255.0;
    CGFloat blue  = (hex & 0x0000FF) / 255.0;
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

@end