//
//  UIButton+QFBtn.m
//  FunTV
//
//  Created by mac on 22.8.23.
//

#import "UIButton+XJBtn.h"
#import <objc/runtime.h>
@implementation UIButton (XJBtn)

-(void)setExpendInsets:(UIEdgeInsets)expendInsets{
    objc_setAssociatedObject(self, @selector(expendInsets), [NSValue valueWithUIEdgeInsets:expendInsets], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIEdgeInsets)expendInsets{
    return [objc_getAssociatedObject(self, _cmd) UIEdgeInsetsValue];

}


-(BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event{
    CGRect rect = UIEdgeInsetsInsetRect(self.bounds, self.expendInsets);
    if (CGRectEqualToRect(rect, self.bounds))
    {
        return [super pointInside:point withEvent:event];
    }
    return CGRectContainsPoint(rect, point) ? YES : NO;
}

@end
