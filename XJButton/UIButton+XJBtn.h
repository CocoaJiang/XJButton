//
//  UIButton+QFBtn.h
//  FunTV
//
//  Created by mac on 22.8.23.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (XJBtn)
/// 扩大按钮响应区域，上左下右，负数扩大正数缩小
@property (nonatomic ,assign) UIEdgeInsets expendInsets;
@end

NS_ASSUME_NONNULL_END
