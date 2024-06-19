//
//  LMButton.h
//  LM
//
//  Created by 张晓红 on 2023/1/5.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, XJButtonImagePosition) {
    XJButtonImagePositionTop,             // imageView在titleLabel上面
    XJButtonImagePositionLeft,            // imageView在titleLabel左边
    XJButtonImagePositionBottom,          // imageView在titleLabel下面
    XJButtonImagePositionRight,           // imageView在titleLabel右边
};


typedef NS_ENUM(NSInteger , XJButtonGradientType){
    ///从左到右
    XJButtonGradientChangeDirectionLevel = 0,
    ///从上到下
    XJButtonGradientChangeDirectionVertical = 1,
    ///向下对角线渐变
    XJButtonGradientChangeDirectionUpwardDiagonalLine = 2,
    ///向上对角线渐变
    XJButtonGradientChangeDirectionDownDiagonalLine = 3,
};


@interface XJButton : UIButton


/// 初始化button
/// @param title 标题
/// @param imageName 图片名称_str
/// @param action 事件的回调
-(instancetype)initWithTitle:(NSString *_Nullable)title
            andWithImageName:(NSString *_Nullable)imageName
               andWithAction:(void(^ _Nullable )(XJButton * _Nonnull button))action;


/// 初始化button
/// @param title 标题
/// @param image 图片_image
/// @param action 事件的回调
-(instancetype)initWithTitle:(NSString *_Nullable)title
                andWithImage:(UIImage *_Nullable)image
               andWithAction:(void(^ _Nullable )(XJButton * _Nonnull button))action;


/// 设置选中标题
@property (nonatomic,copy,readonly) XJButton * (^setSeletedTitle) (NSString * text);

/// 设置标题
@property (nonatomic,copy,readonly) XJButton * (^setTitle) (NSString * text);

/// 设置选中图片
@property(nonatomic,copy,readonly) XJButton *(^setSeletedImage)(UIImage *image);

/// 设置普通图片
@property(nonatomic,copy,readonly) XJButton *(^setImage)(UIImage *image);

/// 设置事件
@property(nonatomic,copy,readonly) XJButton *(^setAction)(void(^)(XJButton *button));

/// 设置字体
@property(nonatomic,copy,readonly) XJButton *(^setFont)(UIFont *font);

/// 设置字体颜色
@property(nonatomic,copy,readonly) XJButton *(^setTextColor)(UIColor *color);

/// 设置背景颜色
@property(nonatomic,copy,readonly) XJButton *(^setBgColor)(UIColor *color);

/// 设置布局方式
@property(nonatomic,copy,readonly) XJButton *(^setImagePosition)(XJButtonImagePosition imagePosition);

/// 图片距离文字的距离
@property(nonatomic,copy,readonly) XJButton *(^setSpacingBetweenImageAndTitle)(CGFloat spacingBetweenImageAndTitle);

/// 设置圆角 备注:如果是 -1 则自动切半圆
@property(nonatomic,copy,readonly) XJButton *(^setCornerRadius)(CGFloat cornerRadius);

/// 支持格式copy 其他label的格式包含如下 :  copy 字体颜色 . copy 背景颜色    copy 字体
@property(nonatomic,copy,readonly) XJButton *(^setTheSameAppearanceAsButton)(UIButton *button);

/// 设置内边距
@property(nonatomic,copy,readonly) XJButton *(^setContentEdgeInsets)(UIEdgeInsets edgeInsets);

/// 设置点击区域_一般做扩大点击区域来用 参数类似  UIEdgeInsetsMake(-10, -10, -10, -10); 表示,上下左右各扩大10
@property(nonatomic,copy,readonly) XJButton *(^setExpandClickArea)(UIEdgeInsets expandClickArea);

/// 设置某一个位置的圆角 优先级要高于 cornerRadius; 默认半圆, 可根据 oneOrMorecornerRadius  == -1 则是半圆
/// 与 cornerRadius 属性互斥 ，调用者只需要调用一个即可
@property(nonatomic,copy,readonly) XJButton *(^setOneOrMoreCorner)(UIRectCorner corner,CGFloat oneOrMorecornerRadius);

/// 设置button 背景色 渐变 颜色值，渐变方向。
@property(nonatomic,copy,readonly) XJButton *(^setGradation)(NSArray <UIColor *> *colors,XJButtonGradientType type);

/// 设置属性字符串
@property(nonatomic,copy,readonly) XJButton *(^setAttributedString)(NSMutableAttributedString *attributedString);


@end

NS_ASSUME_NONNULL_END
