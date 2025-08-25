//
//  MyTableViewCell.h
//
//  Created by Le Tien Dat on 8/25/25.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyTableViewCell : UITableViewCell

@property (nonatomic, copy) void(^actionButtonTapped)(void);

- (void)setTitle:(NSString *)title description:(NSString *)description iconApp:(nullable UIImage *)iconApp lastCell:(BOOL)isLastCell;

@end

NS_ASSUME_NONNULL_END