//
//  XJLayoutTools.h
//  test_button_icon
//
//  Created by mac on 2024/6/18.
//

#define XJArgumentToString(macro) #macro
#define XJClangWarningConcat(warning_name) XJArgumentToString(clang diagnostic ignored warning_name)

#define XJBeginIgnoreClangWarning(warningName) _Pragma("clang diagnostic push") _Pragma(XJClangWarningConcat(#warningName))
#define XJEndIgnoreClangWarning _Pragma("clang diagnostic pop")

#define XJBeginIgnorePerformSelectorLeaksWarning XJBeginIgnoreClangWarning(-Warc-performSelector-leaks)
#define XJEndIgnorePerformSelectorLeaksWarning XJEndIgnoreClangWarning

#define XJBeginIgnoreAvailabilityWarning XJBeginIgnoreClangWarning(-Wpartial-availability)
#define XJEndIgnoreAvailabilityWarning XJEndIgnoreClangWarning

#define XJBeginIgnoreDeprecatedWarning XJBeginIgnoreClangWarning(-Wdeprecated-declarations)
#define XJEndIgnoreDeprecatedWarning XJEndIgnoreClangWarning

#ifndef XJLayoutTools_h
#define XJLayoutTools_h


#pragma mark - 布局的内连函数
static inline  CGFloat removeFloatMin(CGFloat floatValue) {
    return floatValue == CGFLOAT_MIN ? 0 : floatValue;
}

static inline  CGFloat flatSpecificScale(CGFloat floatValue, CGFloat scale) {
    floatValue = removeFloatMin(floatValue);
    scale = scale ?: [[UIScreen mainScreen] scale];
    CGFloat flattedValue = ceil(floatValue * scale) / scale;
    return flattedValue;
}

static inline  CGFloat flat(CGFloat floatValue) {
    return flatSpecificScale(floatValue, 0);
}

static inline  UIEdgeInsets UIEdgeInsetsRemoveFloatMin(UIEdgeInsets insets) {
    UIEdgeInsets result = UIEdgeInsetsMake(removeFloatMin(insets.top), removeFloatMin(insets.left), removeFloatMin(insets.bottom), removeFloatMin(insets.right));
    return result;
}

static inline  CGFloat UIEdgeInsetsGetHorizontalValue(UIEdgeInsets insets) {
    return insets.left + insets.right;
}

static inline  CGFloat UIEdgeInsetsGetVerticalValue(UIEdgeInsets insets) {
    return insets.top + insets.bottom;
}

static inline  CGRect CGRectMakeWithSize(CGSize size) {
    return CGRectMake(0, 0, size.width, size.height);
}

static inline  CGRect CGRectSetX(CGRect rect, CGFloat x) {
    rect.origin.x = flat(x);
    return rect;
}

static inline  CGFloat CGFloatGetCenter(CGFloat parent, CGFloat child) {
    return flat((parent - child) / 2.0);
}

static inline  CGRect CGRectSetWidth(CGRect rect, CGFloat width) {
    if (width < 0) {
        return rect;
    }
    rect.size.width = flat(width);
    return rect;
}

static inline  CGRect CGRectSetY(CGRect rect, CGFloat y) {
    rect.origin.y = flat(y);
    return rect;
}

static inline  CGRect CGRectSetHeight(CGRect rect, CGFloat height) {
    if (height < 0) {
        return rect;
    }
    rect.size.height = flat(height);
    return rect;
}
static inline  CGRect CGRectFlatted(CGRect rect) {
    return CGRectMake(flat(rect.origin.x), flat(rect.origin.y), flat(rect.size.width), flat(rect.size.height));
}

static inline  CGRect
CGRectFlatMake(CGFloat x, CGFloat y, CGFloat width, CGFloat height) {
    return CGRectMake(flat(x), flat(y), flat(width), flat(height));
}

/// 获取rect的center，包括rect本身的x/y偏移
static inline CGPoint
CGPointGetCenterWithRect(CGRect rect) {
    return CGPointMake(flat(CGRectGetMidX(rect)), flat(CGRectGetMidY(rect)));
}


#endif /* XJLayoutTools_h */
