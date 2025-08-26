//
//  MyTableViewCell.m
//
//  Created by Le Tien Dat on 8/25/25.
//

#import "MyTableViewCell.h"
#import "../../Categories/UIColor+Hex.h"
#import "../../Const/AppConst.h"

@interface MyTableViewCell ()

@property (strong, nonatomic) UIView *containerIconAppImageView;
@property (strong, nonatomic) UIImageView *iconAppImageView;
@property (strong, nonatomic) UITextView *titleTextView;
@property (strong, nonatomic) UITextView *descriptionTextView;
@property (strong, nonatomic) UIButton *actionButton;
@property (strong, nonatomic) UIView *seperatorLine;
@property (strong, nonatomic) NSLayoutConstraint *leadingSeperatorConstraint;

@end

@implementation MyTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setupUI];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    self.selectionStyle = UITableViewCellSelectionStyleNone;

    _containerIconAppImageView = [UIView new];
    _containerIconAppImageView.backgroundColor = [UIColor clearColor];
    _containerIconAppImageView.layer.shadowColor = [UIColor blackColor].CGColor;
    _containerIconAppImageView.layer.shadowOpacity = 0.2;
    _containerIconAppImageView.layer.shadowOffset = CGSizeMake(-3, 3);
    _containerIconAppImageView.layer.shadowRadius = 3;
    _containerIconAppImageView.layer.masksToBounds = NO;
    _containerIconAppImageView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:_containerIconAppImageView];
    
    _iconAppImageView = [UIImageView new];
    _iconAppImageView.translatesAutoresizingMaskIntoConstraints = NO;
    _iconAppImageView.layer.masksToBounds = YES;
    _iconAppImageView.layer.cornerRadius = 10;
    [_containerIconAppImageView addSubview:_iconAppImageView];

    _titleTextView = [UITextView new];
    _titleTextView.scrollEnabled = NO;
    _titleTextView.editable = NO;
    _titleTextView.textContainerInset = UIEdgeInsetsZero;
    _titleTextView.font = [UIFont boldSystemFontOfSize:17];
    _titleTextView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:_titleTextView];

    _descriptionTextView = [UITextView new];
    _descriptionTextView.scrollEnabled = NO;
    _descriptionTextView.editable = NO;
    _descriptionTextView.textContainerInset = UIEdgeInsetsZero;
    _descriptionTextView.font = [UIFont systemFontOfSize:14];
    _descriptionTextView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:_descriptionTextView];
    
    _actionButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [_actionButton setImage:[UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/icon-action.png", AppConst.bundlePath]] forState:UIControlStateNormal];
    _actionButton.tintColor = UIColor.blackColor;
    _actionButton.contentEdgeInsets = UIEdgeInsetsMake(5, 5, 5, 5);
    _actionButton.translatesAutoresizingMaskIntoConstraints = NO;
    [_actionButton addTarget:self action:@selector(actionButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:_actionButton];
    
    _seperatorLine = [UIView new];
    _seperatorLine.backgroundColor = [UIColor colorWithHex:0x3c3c43 alpha:0.23];
    _seperatorLine.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:_seperatorLine];

    [NSLayoutConstraint activateConstraints:@[
        [_containerIconAppImageView.topAnchor constraintEqualToAnchor:self.contentView.topAnchor constant:8],
        [_containerIconAppImageView.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor constant:16],
        [_containerIconAppImageView.bottomAnchor constraintLessThanOrEqualToAnchor:_seperatorLine.topAnchor constant:-8],

        [_iconAppImageView.topAnchor constraintEqualToAnchor:_containerIconAppImageView.topAnchor],
        [_iconAppImageView.leadingAnchor constraintEqualToAnchor:_containerIconAppImageView.leadingAnchor],
        [_iconAppImageView.trailingAnchor constraintEqualToAnchor:_containerIconAppImageView.trailingAnchor],
        [_iconAppImageView.bottomAnchor constraintEqualToAnchor:_containerIconAppImageView.bottomAnchor],
        [_iconAppImageView.widthAnchor constraintEqualToConstant:50],
        [_iconAppImageView.heightAnchor constraintEqualToConstant:50],

        [_actionButton.topAnchor constraintEqualToAnchor:self.contentView.topAnchor constant:8],
        [_actionButton.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor constant:-8],
        [_actionButton.bottomAnchor constraintLessThanOrEqualToAnchor:_seperatorLine.topAnchor constant:-8],
        [_actionButton.widthAnchor constraintEqualToConstant:30],
        [_actionButton.heightAnchor constraintEqualToConstant:30],
        
        [_titleTextView.topAnchor constraintEqualToAnchor:self.contentView.topAnchor constant:8],
        [_titleTextView.leadingAnchor constraintEqualToAnchor:_containerIconAppImageView.trailingAnchor constant:8],
        [_titleTextView.trailingAnchor constraintEqualToAnchor:_actionButton.leadingAnchor constant:-8],

        [_descriptionTextView.topAnchor constraintEqualToAnchor:_titleTextView.bottomAnchor constant:8],
        [_descriptionTextView.leadingAnchor constraintEqualToAnchor:_titleTextView.leadingAnchor],
        [_descriptionTextView.trailingAnchor constraintEqualToAnchor:_titleTextView.trailingAnchor],
        
        [_seperatorLine.topAnchor constraintGreaterThanOrEqualToAnchor:_descriptionTextView.bottomAnchor constant:8],
        [_seperatorLine.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor],
        [_seperatorLine.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor],
        [_seperatorLine.heightAnchor constraintEqualToConstant:0.333]
    ]];
    _leadingSeperatorConstraint = [_seperatorLine.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor];
}

- (void)setTitle:(NSString *)title description:(NSString *)description iconApp:(nullable UIImage *)iconApp  lastCell:(BOOL)isLastCell {
    if (iconApp) {
        [_iconAppImageView setImage:iconApp];
    } else {
        _iconAppImageView.image = [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/icon-app-placeholder.png", AppConst.bundlePath]];
    }
    _titleTextView.text = title;
    _descriptionTextView.text = description;
    _leadingSeperatorConstraint.constant = isLastCell ? 0 : 16;
    _leadingSeperatorConstraint.active = YES;
}

- (void)actionButtonTapped:(UIButton *)sender {
    if (self.actionButtonTapped) {
        self.actionButtonTapped();
    }
}

@end