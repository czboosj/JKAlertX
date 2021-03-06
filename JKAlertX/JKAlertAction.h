//
//  JKAlertAction.h
//  TestVideoAndPicture
//
//  Created by albert on 2017/4/18.
//  Copyright © 2017年 安永博. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    JKAlertActionStyleDefault, // 默认黑色字体
    JKAlertActionStyleDestructive, // 红色字体
} JKAlertActionStyle;

@interface JKAlertAction : NSObject

/** attributedTitle */
@property (nonatomic, strong, readonly) NSAttributedString *attributedTitle;

/** title */
@property (nonatomic, copy, readonly) NSString *title;

/** handler */
@property (nonatomic, copy, readonly) void (^handler)(JKAlertAction *action);

/** normalImage */
@property (nonatomic, strong) UIImage *normalImage;

/** hightlightedImage */
@property (nonatomic, strong) UIImage *hightlightedImage;

/**
 * 是否是空的action
 * 以上5个属性都为nil时即为空的action
 * 空action在非plain样式以外，点击将没有任何反应
 */
@property (nonatomic, assign, readonly) BOOL isEmpty;

/** 样式 */
@property (nonatomic, assign, readonly) JKAlertActionStyle alertActionStyle;

/** actionSheet样式cell高度 */
@property (nonatomic, assign, readonly) CGFloat rowHeight;

/** 是否隐藏分隔线 */
@property (nonatomic, assign) BOOL separatorLineHidden;

/**
 * 自定义的view
 * 注意要自己计算好frame
 * action.customView将会自动适应宽度，所以frame给出高度即可
 * actionSheet样式的行高rowHeight将取决于action.customView的高度
 * 自定义时请将action.customView视为一个容器view
 * 推荐使用自动布局在action.customView约束子控件
 */
@property (nonatomic, strong) UIView *customView;

/**
 * 实例化action
 * title: 标题
 * style: 样式
 * handler: 点击的操作
 */
+ (instancetype)actionWithTitle:(NSString *)title style:(JKAlertActionStyle)style handler:(void(^)(JKAlertAction *action))handler;

/**
 * 链式实例化action
 * title: 标题
 * style: 样式
 * handler: 点击的操作
 */
+ (JKAlertAction *(^)(NSString *title, JKAlertActionStyle style, void(^handler)(JKAlertAction *action)))action;

/**
 * 实例化action
 * attributedTitle: 富文本标题
 * style: 样式
 * handler: 点击的操作
 */
+ (instancetype)actionWithAttributedTitle:(NSAttributedString *)attributedTitle handler:(void(^)(JKAlertAction *action))handler;

/**
 * 链式实例化action
 * attributedTitle: 富文本标题
 * style: 样式
 * handler: 点击的操作
 */
+ (JKAlertAction *(^)(NSAttributedString *attributedTitle, void(^handler)(JKAlertAction *action)))actionAttributed;


/** 设置普通状态图片 */
@property (nonatomic, copy, readonly) JKAlertAction *(^setNormalImage)(UIImage *image);

/** 设置高亮状态图片 */
@property (nonatomic, copy, readonly) JKAlertAction *(^setHightlightedImage)(UIImage *image);

/** 设置是否隐藏分隔线 */
@property (nonatomic, copy, readonly) JKAlertAction *(^setSeparatorLineHidden)(BOOL hidden);

/**
 * 设置自定义的view
 * 注意要自己计算好frame
 * action.customView将会自动适应宽度，所以frame给出高度即可
 * actionSheet样式的行高rowHeight将取决于action.customView的高度
 * 自定义时请将action.customView视为一个容器view
 * 推荐使用自动布局在action.customView约束子控件
 */
@property (nonatomic, copy, readonly) JKAlertAction *(^setCustomView)(UIView *(^customView)(void));
@end
