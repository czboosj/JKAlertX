//
//  JKAlertCollectionViewCell.m
//  JKAlert
//
//  Created by albert on 2018/4/4.
//  Copyright © 2018年 安永博. All rights reserved.
//

#import "JKAlertCollectionViewCell.h"
#import "JKAlertAction.h"

@interface JKAlertCollectionViewCell ()
/** imageButton */
@property (nonatomic, weak) UIButton *imageButton;

/** titleLabel */
@property (nonatomic, weak) UILabel *titleLabel;

/** customView */
@property (nonatomic, weak) UIView *customView;
@end

@implementation JKAlertCollectionViewCell

- (UIButton *)imageButton{
    if (!_imageButton) {
        
        UIButton *imageButton = [UIButton buttonWithType:(UIButtonTypeSystem)];
        imageButton.userInteractionEnabled = NO;
        [self.contentView addSubview:imageButton];
        
        imageButton.translatesAutoresizingMaskIntoConstraints = NO;
        NSLayoutConstraint *imageButtonTopCons = [NSLayoutConstraint constraintWithItem:imageButton attribute:(NSLayoutAttributeTop) relatedBy:(NSLayoutRelationEqual) toItem:self.contentView attribute:(NSLayoutAttributeTop) multiplier:1 constant:0];
        NSLayoutConstraint *imageButtonLeftCons = [NSLayoutConstraint constraintWithItem:imageButton attribute:(NSLayoutAttributeLeft) relatedBy:(NSLayoutRelationEqual) toItem:self.contentView attribute:(NSLayoutAttributeLeft) multiplier:1 constant:15];
        NSLayoutConstraint *imageButtonRightCons = [NSLayoutConstraint constraintWithItem:imageButton attribute:(NSLayoutAttributeRight) relatedBy:(NSLayoutRelationEqual) toItem:self.contentView attribute:(NSLayoutAttributeRight) multiplier:1 constant:-15];
        NSLayoutConstraint *imageButtonHeightCons = [NSLayoutConstraint constraintWithItem:imageButton attribute:(NSLayoutAttributeHeight) relatedBy:(NSLayoutRelationEqual) toItem:imageButton attribute:(NSLayoutAttributeWidth) multiplier:1 constant:0];
        [self.contentView addConstraints:@[imageButtonTopCons, imageButtonLeftCons, imageButtonRightCons, imageButtonHeightCons]];
        
        _imageButton = imageButton;
    }
    return _imageButton;
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        
        UILabel *titleLabel = [[UILabel alloc] init];
        [self.contentView addSubview:titleLabel];
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
        NSLayoutConstraint *titleLabelLeftCons = [NSLayoutConstraint constraintWithItem:titleLabel attribute:(NSLayoutAttributeLeft) relatedBy:(NSLayoutRelationEqual) toItem:self.contentView attribute:(NSLayoutAttributeLeft) multiplier:1 constant:0];
        NSLayoutConstraint *titleLabelRightCons = [NSLayoutConstraint constraintWithItem:titleLabel attribute:(NSLayoutAttributeRight) relatedBy:(NSLayoutRelationEqual) toItem:self.contentView attribute:(NSLayoutAttributeRight) multiplier:1 constant:0];
        NSLayoutConstraint *titleLabelBottomCons = [NSLayoutConstraint constraintWithItem:titleLabel attribute:(NSLayoutAttributeBottom) relatedBy:(NSLayoutRelationEqual) toItem:self.contentView attribute:(NSLayoutAttributeBottom) multiplier:1 constant:0];
        [self.contentView addConstraints:@[titleLabelLeftCons, titleLabelRightCons, titleLabelBottomCons]];
        _titleLabel = titleLabel;
        
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = [UIFont systemFontOfSize:13];
        _titleLabel.lineBreakMode = NSLineBreakByTruncatingMiddle;
    }
    return _titleLabel;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self initialization];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        [self initialization];
    }
    return self;
}

- (void)initialization{
    
//    self.selectedBackgroundView = [[UIView alloc] init];
//    self.selectedBackgroundView.backgroundColor = [UIColor colorWithRed:211.0/255.0 green:211.0/255.0 blue:211.0/255.0 alpha:1];
    
//    self.contentView.backgroundColor = [UIColor orangeColor];
//    imageButton.backgroundColor = [UIColor redColor];
//    titleLabel.backgroundColor = [UIColor greenColor];
    
//    [self imageButton];
//
//    [self titleLabel];
}

- (void)setSelected:(BOOL)selected{
    [super setSelected:selected];
    
    _imageButton.highlighted = selected;
    
    if (!selected) {
        
        _titleLabel.textColor = (self.action.alertActionStyle == JKAlertActionStyleDefault) ? [UIColor colorWithRed:102.0/255.0 green:102.0/255.0 blue:102.0/255.0 alpha:1] : [UIColor redColor];
        
        return;
    }
    
    _titleLabel.textColor = (self.action.alertActionStyle == JKAlertActionStyleDefault) ? [UIColor colorWithRed:186.0/255.0 green:186.0/255.0 blue:186.0/255.0 alpha:1] : [[UIColor redColor] colorWithAlphaComponent:0.5];
}

- (void)setHighlighted:(BOOL)highlighted{
    [super setHighlighted:highlighted];
    
    _imageButton.highlighted = highlighted;
    
    if (!highlighted) {
        
        _titleLabel.textColor = (self.action.alertActionStyle == JKAlertActionStyleDefault) ? [UIColor colorWithRed:102.0/255.0 green:102.0/255.0 blue:102.0/255.0 alpha:1] : [UIColor redColor];
        
        return;
    }
    
    _titleLabel.textColor = (self.action.alertActionStyle == JKAlertActionStyleDefault) ? [UIColor colorWithRed:186.0/255.0 green:186.0/255.0 blue:186.0/255.0 alpha:1] : [[UIColor redColor] colorWithAlphaComponent:0.5];
}

- (void)setAction:(JKAlertAction *)action{
    _action = action;
    
    _titleLabel.hidden = NO;
    _imageButton.hidden = _titleLabel.hidden;
    
    if (action.customView != nil) {
        
        _titleLabel.hidden = YES;
        _imageButton.hidden = _titleLabel.hidden;
        
        self.customView = action.customView;
        
        _customView.hidden = NO;
        
        return;
    }
    
    _customView.hidden = YES;
    
    self.titleLabel.textColor = (action.alertActionStyle == JKAlertActionStyleDefault) ? [UIColor colorWithRed:102.0/255.0 green:102.0/255.0 blue:102.0/255.0 alpha:1] : [UIColor redColor];
    
    self.titleLabel.attributedText = action.attributedTitle;
    
    self.titleLabel.text = action.title;
    
    [self.imageButton setBackgroundImage:_action.normalImage forState:(UIControlStateNormal)];
    [self.imageButton setBackgroundImage:_action.hightlightedImage forState:(UIControlStateHighlighted)];
}

- (void)setCustomView:(UIView *)customView{
    
    if (_customView == customView) {
        return;
    }
    
    [_customView removeFromSuperview];
    
    _customView = customView;
    
    [self.contentView addSubview:_customView];
    
    customView.translatesAutoresizingMaskIntoConstraints = NO;
    NSArray *customViewCons1 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[customView]-0-|" options:0 metrics:nil views:@{@"customView" : customView}];
    [self addConstraints:customViewCons1];
    
    NSArray *customViewCons2 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[customView]-0-|" options:0 metrics:nil views:@{@"customView" : customView}];
    [self addConstraints:customViewCons2];
}
@end
