#import "AppConst.h"

@implementation AppConst : NSObject

+ (NSString *)bundlePath {
    return [[NSBundle mainBundle] bundlePath];
}

@end