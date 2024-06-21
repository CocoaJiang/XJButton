//
//  LMButton.h
//  LM
//
//  Created by 张晓红 on 2023/1/5.
//
#import "XJButton.h"
#import "XJLayoutTools.h"
#import "UIButton+XJBtn.h"
@interface XJButton ()
@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) UIImage *image;
@property (nonatomic,copy)void(^actionBlock)(XJButton *);
@property (nonatomic,assign) XJButtonImagePosition imagePosition;
@property (nonatomic,assign) CGFloat spacingBetweenImageAndTitle;
@property (nonatomic,assign) CGFloat cornerRadius;
@property (nonatomic,assign) CGFloat oneOrMorecornerRadius;
@property (nonatomic,assign) UIRectCorner corner;
@property(strong,nonatomic) NSArray<UIColor *> *colors;
@property(assign,nonatomic) XJButtonGradientType type;
@property(strong,nonatomic) CAGradientLayer *gradientLayer;
@property(strong,nonatomic) CAShapeLayer *shapeLayer;
@end


@implementation XJButton




-(instancetype)initWithTitle:(NSString *)title andWithImage:(UIImage *)image andWithAction:(void (^)(XJButton * _Nonnull))action{
    _title = title;
    _image = image;
    _actionBlock = [action copy];
    return [self initWithFrame:CGRectZero];
}

-(instancetype)initWithTitle:(NSString *)title andWithImageName:(NSString *)imageName andWithAction:(void (^)(XJButton * _Nonnull))action{
    return [self initWithTitle:title andWithImage:[UIImage imageNamed:imageName] andWithAction:action];
}



-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self didInit];
    }
    return self;
}

-(instancetype)initWithCoder:(NSCoder *)coder{
    if (self = [super initWithCoder:coder]) {
        [self didInit];
    }
    return self;
}

#pragma mark - 接口部分

-(void)buttonClick:(XJButton *)button{
    if (self.actionBlock) {
        self.actionBlock(button);
    }
}

-(void)didInit{
    
    if (_title) {
        [self setTitle:_title forState:UIControlStateNormal];
    }
    if (_image) {
        [self setImage:_image forState:UIControlStateNormal];
    }
(*     if (_actionBlock) { *)
        [self addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
(*     } *)
}

-(XJButton * _Nonnull (^)(NSString * _Nonnull))setSeletedTitle{
    __weak typeof(self)weakSelf = self;
    return ^(NSString *seletedTitle){
        __strong typeof(weakSelf)strongSelf = weakSelf;
        [strongSelf setTitle:seletedTitle forState:UIControlStateSelected];
        return strongSelf;
    };
}

-(XJButton * _Nonnull (^)(NSString * _Nonnull))setTitle{
    __weak typeof(self)weakSelf = self;
    return ^(NSString *title){
        __strong typeof(weakSelf)strongSelf = weakSelf;
        [strongSelf setTitle:title forState:UIControlStateNormal];
        return strongSelf;
    };
}

-(XJButton * _Nonnull (^)(UIImage * _Nonnull))setImage{
    __weak typeof(self)weakSelf = self;
    return ^(UIImage *img){
        __strong typeof(weakSelf)strongSelf = weakSelf;
        [strongSelf setImage:img forState:UIControlStateNormal];
        return strongSelf;
    };
}

-(XJButton * _Nonnull (^)(UIImage * _Nonnull))setSeletedImage{
    __weak typeof(self)weakSelf = self;
    return ^(UIImage *seletedImage){
        __strong typeof(weakSelf)strongSelf = weakSelf;
        [strongSelf setImage:seletedImage forState:UIControlStateSelected];
        return strongSelf;
    };
}

-(XJButton * _Nonnull (^)(void (^ _Nonnull)(XJButton * _Nonnull)))setAction{
    __weak typeof(self)weakSelf = self;
    return ^(void(^action)(XJButton *button)){
        __strong typeof(weakSelf)strongSelf = weakSelf;
        strongSelf.actionBlock = [action copy];
        return strongSelf;
    };
}

-(XJButton * _Nonnull (^)(UIFont * _Nonnull))setFont{
    __weak typeof(self)weakSelf = self;
    return ^(UIFont *font){
        __strong typeof(weakSelf)strongSelf = weakSelf;
        strongSelf.titleLabel.font = font;
        return strongSelf;
    };
}
-(XJButton * _Nonnull (^)(UIColor * _Nonnull))setTextColor{
    __weak typeof(self)weakSelf = self;
    return ^(UIColor *color){
        __strong typeof(weakSelf)strongSelf = weakSelf;
        [strongSelf setTitleColor:color forState:UIControlStateNormal];
        return strongSelf;
    };
}

-(XJButton * _Nonnull (^)(UIColor * _Nonnull))setBgColor{
    __weak typeof(self)weakSelf = self;
    return ^(UIColor *color){
        __strong typeof(weakSelf)strongSelf = weakSelf;
        [strongSelf setBackgroundColor:color];
        return strongSelf;
    };
}

-(XJButton * _Nonnull (^)(XJButtonImagePosition))setImagePosition{
    __weak typeof(self)weakSelf = self;
    return ^(XJButtonImagePosition imagePosition){
        __strong typeof(weakSelf)strongSelf = weakSelf;
        strongSelf.imagePosition = imagePosition;
        [strongSelf setNeedsLayout];
        return strongSelf;
    };
}

-(XJButton * _Nonnull (^)(CGFloat))setSpacingBetweenImageAndTitle{
    __weak typeof(self)weakSelf = self;
    return ^(CGFloat spacingBetweenImageAndTitle){
        __strong typeof(weakSelf)strongSelf = weakSelf;
        strongSelf.spacingBetweenImageAndTitle = spacingBetweenImageAndTitle;
        [strongSelf setNeedsLayout];
        return strongSelf;
    };
}

-(XJButton * _Nonnull (^)(CGFloat))setCornerRadius{
    __weak typeof(self)weakSelf = self;
    return ^(CGFloat cornerRadius){
        __strong typeof(weakSelf)strongSelf = weakSelf;
        if (cornerRadius != -1) {
            strongSelf.layer.cornerRadius = cornerRadius;
            self.cornerRadius = cornerRadius;
        }
        strongSelf.cornerRadius = cornerRadius;
        [strongSelf setNeedsLayout];
        return strongSelf;
    };
}

-(XJButton * _Nonnull (^)(UIButton * _Nonnull))setTheSameAppearanceAsButton{
    __weak typeof(self)weakSelf = self;
    return ^(UIButton *button){
        __strong typeof(weakSelf)strongSelf = weakSelf;
        strongSelf.setFont(button.titleLabel.font).setTextColor(button.titleLabel.textColor).setBgColor(button.backgroundColor);
        return strongSelf;
    };
}

-(XJButton * _Nonnull (^)(UIEdgeInsets))setContentEdgeInsets{
    __weak typeof(self)weakSelf = self;
    return ^(UIEdgeInsets edgeInsets){
        __strong typeof(weakSelf)strongSelf = weakSelf;
        [strongSelf setContentEdgeInsets:edgeInsets];
        [strongSelf setNeedsLayout];
        return strongSelf;
    };
}

-(XJButton * _Nonnull (^)(UIEdgeInsets))setExpandClickArea{
    __weak typeof(self)weakSelf = self;;
    return ^(UIEdgeInsets expandClickArea){
        __strong typeof(weakSelf)strongSelf = weakSelf;
        strongSelf.expendInsets = expandClickArea;
        return strongSelf;
    };
}

-(XJButton * _Nonnull (^)(UIRectCorner, CGFloat))setOneOrMoreCorner{
    __weak typeof(self)weakSelf = self;
    return ^(UIRectCorner corner,CGFloat radias){
        __strong typeof(weakSelf)strongSelf = weakSelf;
        strongSelf.corner = corner;
        strongSelf.oneOrMorecornerRadius = radias;
        [strongSelf setNeedsLayout];
        return strongSelf;
    };
}

-(XJButton * _Nonnull (^)(NSArray<UIColor *> * _Nonnull, XJButtonGradientType))setGradation{
    __weak typeof(self)weakSelf = self;
    return ^(NSArray<UIColor *> * _Nonnull colors,XJButtonGradientType type){
        __strong typeof(weakSelf)strongSelf = weakSelf;
        strongSelf.type = type;
        strongSelf.colors = colors;
        NSMutableArray *c_array = [[NSMutableArray alloc]init];
        for (UIColor * c in strongSelf.colors) {
            [c_array addObject:(id)c.CGColor];
        }
        self.gradientLayer.colors = (NSArray *)c_array;

        CGPoint  p_start = CGPointZero;
        if (strongSelf.type==XJButtonGradientChangeDirectionUpwardDiagonalLine) {
            p_start = CGPointMake(0.0f, 0.1f);
        }
        strongSelf.gradientLayer.startPoint = p_start;

        CGPoint p_end = CGPointZero;

        switch (strongSelf.type) {
            case XJButtonGradientChangeDirectionLevel:
                   p_end = CGPointMake(1.0, 0.0);
                   break;
            case XJButtonGradientChangeDirectionVertical:
                   p_end = CGPointMake(0.0, 1.0);
                   break;
            case XJButtonGradientChangeDirectionUpwardDiagonalLine:
                   p_end = CGPointMake(1.0, 1.0);
                   break;
            case XJButtonGradientChangeDirectionDownDiagonalLine:
                   p_end = CGPointMake(1.0, 0.0);
                   break;
               default:
                   break;
        }
        strongSelf.gradientLayer.endPoint = p_end;
        [strongSelf.layer insertSublayer:self.gradientLayer atIndex:0];
        [strongSelf setNeedsLayout];
        return strongSelf;
    };
}

-(XJButton * _Nonnull (^)(NSMutableAttributedString * _Nonnull))setAttributedString{
    __weak typeof(self)weakSelf = self;
    return ^(NSMutableAttributedString *str){
        __strong typeof(weakSelf)strongSelf = weakSelf;
        [strongSelf setAttributedTitle:str forState:UIControlStateSelected];
        return strongSelf;
    };
}

#pragma mark - 布局分布

- (CGSize)sizeThatFits:(CGSize)size {
    // 如果调用 sizeToFit，那么传进来的 size 就是当前按钮的 size，此时的计算不要去限制宽高
    if (CGSizeEqualToSize(self.bounds.size, size)) {
        size = CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX);
    }
    
    BOOL isImageViewShowing = !!self.currentImage;
    BOOL isTitleLabelShowing = !!self.currentTitle || self.currentAttributedTitle;
    CGSize imageTotalSize = CGSizeZero;// 包含 imageEdgeInsets 那些空间
    CGSize titleTotalSize = CGSizeZero;// 包含 titleEdgeInsets 那些空间
    CGFloat spacingBetweenImageAndTitle = flat(isImageViewShowing && isTitleLabelShowing ? self.spacingBetweenImageAndTitle : 0);// 如果图片或文字某一者没显示，则这个 spacing 不考虑进布局
    UIEdgeInsets contentEdgeInsets = UIEdgeInsetsRemoveFloatMin(self.contentEdgeInsets);
    CGSize resultSize = CGSizeZero;
    CGSize contentLimitSize = CGSizeMake(size.width - UIEdgeInsetsGetHorizontalValue(contentEdgeInsets), size.height - UIEdgeInsetsGetVerticalValue(contentEdgeInsets));
    
    switch (self.imagePosition) {
        case XJButtonImagePositionTop:
        case XJButtonImagePositionBottom: {
            // 图片和文字上下排版时，宽度以文字或图片的最大宽度为最终宽度
            if (isImageViewShowing) {
                CGFloat imageLimitWidth = contentLimitSize.width - UIEdgeInsetsGetHorizontalValue(self.imageEdgeInsets);
                CGSize imageSize = self.imageView.image ? [self.imageView sizeThatFits:CGSizeMake(imageLimitWidth, CGFLOAT_MAX)] : self.currentImage.size;
                imageSize.width = MIN(imageSize.width, imageLimitWidth);
                imageTotalSize = CGSizeMake(imageSize.width + UIEdgeInsetsGetHorizontalValue(self.imageEdgeInsets), imageSize.height + UIEdgeInsetsGetVerticalValue(self.imageEdgeInsets));
            }
            
            if (isTitleLabelShowing) {
                CGSize titleLimitSize = CGSizeMake(contentLimitSize.width - UIEdgeInsetsGetHorizontalValue(self.titleEdgeInsets), contentLimitSize.height - imageTotalSize.height - spacingBetweenImageAndTitle - UIEdgeInsetsGetVerticalValue(self.titleEdgeInsets));
                CGSize titleSize = [self.titleLabel sizeThatFits:titleLimitSize];
                titleSize.height = MIN(titleSize.height, titleLimitSize.height);
                titleTotalSize = CGSizeMake(titleSize.width + UIEdgeInsetsGetHorizontalValue(self.titleEdgeInsets), titleSize.height + UIEdgeInsetsGetVerticalValue(self.titleEdgeInsets));
            }
            
            resultSize.width = UIEdgeInsetsGetHorizontalValue(contentEdgeInsets);
            resultSize.width += MAX(imageTotalSize.width, titleTotalSize.width);
            resultSize.height = UIEdgeInsetsGetVerticalValue(contentEdgeInsets) + imageTotalSize.height + spacingBetweenImageAndTitle + titleTotalSize.height;
        }
            break;
            
        case XJButtonImagePositionLeft:
        case XJButtonImagePositionRight: {
            if (isImageViewShowing) {
                CGFloat imageLimitHeight = contentLimitSize.height - UIEdgeInsetsGetVerticalValue(self.imageEdgeInsets);
                CGSize imageSize = self.imageView.image ? [self.imageView sizeThatFits:CGSizeMake(CGFLOAT_MAX, imageLimitHeight)] : self.currentImage.size;
                imageSize.height = MIN(imageSize.height, imageLimitHeight);
                imageTotalSize = CGSizeMake(imageSize.width + UIEdgeInsetsGetHorizontalValue(self.imageEdgeInsets), imageSize.height + UIEdgeInsetsGetVerticalValue(self.imageEdgeInsets));
            }
            
            if (isTitleLabelShowing) {
                CGSize titleLimitSize = CGSizeMake(contentLimitSize.width - UIEdgeInsetsGetHorizontalValue(self.titleEdgeInsets) - imageTotalSize.width - spacingBetweenImageAndTitle, contentLimitSize.height - UIEdgeInsetsGetVerticalValue(self.titleEdgeInsets));
                CGSize titleSize = [self.titleLabel sizeThatFits:titleLimitSize];
                titleSize.height = MIN(titleSize.height, titleLimitSize.height);
                titleTotalSize = CGSizeMake(titleSize.width + UIEdgeInsetsGetHorizontalValue(self.titleEdgeInsets), titleSize.height + UIEdgeInsetsGetVerticalValue(self.titleEdgeInsets));
            }
            
            resultSize.width = UIEdgeInsetsGetHorizontalValue(contentEdgeInsets) + imageTotalSize.width + spacingBetweenImageAndTitle + titleTotalSize.width;
            resultSize.height = UIEdgeInsetsGetVerticalValue(contentEdgeInsets);
            resultSize.height += MAX(imageTotalSize.height, titleTotalSize.height);
        }
            break;
    }
    return resultSize;
}

- (CGSize)intrinsicContentSize {
    return [self sizeThatFits:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX)];
}



/// ERROR : 应该访问系统私有方法,这样不太妥当 会触发layoutSubViews
- (UIImageView *)_XJ_imageView {
    XJBeginIgnorePerformSelectorLeaksWarning
    return [self performSelector:NSSelectorFromString(@"_imageView")];
    XJEndIgnorePerformSelectorLeaksWarning
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    if (CGRectIsEmpty(self.bounds)) {
        return;
    }
    
    /// 普通圆角_4
    if (self.cornerRadius == -1) {
        self.layer.cornerRadius = CGRectGetHeight(self.bounds) / 2;
        if(_gradientLayer){
            _gradientLayer.frame = self.bounds;
            _gradientLayer.cornerRadius = self.layer.cornerRadius;
        }
    }else{
        self.layer.cornerRadius = self.cornerRadius;
        if(_gradientLayer){
            _gradientLayer.frame = self.bounds;
            _gradientLayer.cornerRadius = self.layer.cornerRadius;
        }
    }

    ///个别圆角_1-3
    if (self.corner) {
        CGFloat radius = self.oneOrMorecornerRadius == -1 ? CGRectGetHeight(self.bounds)/2 : self.oneOrMorecornerRadius;
        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:self.corner cornerRadii:CGSizeMake(radius, radius)];
        CAShapeLayer *maskLayer = [[CAShapeLayer alloc]init];
        maskLayer.frame = self.bounds;
        maskLayer.path = maskPath.CGPath;
        if(_gradientLayer){
            self.gradientLayer.mask = maskLayer;
            self.gradientLayer.frame = self.bounds;
        }else{
            self.layer.mask = maskLayer;
        }
    }
    
    if(_gradientLayer){
        _gradientLayer.frame = self.bounds;
    }
    
    BOOL isImageViewShowing = !!self.currentImage;
    BOOL isTitleLabelShowing = !!self.currentTitle || !!self.currentAttributedTitle;
    CGSize imageLimitSize = CGSizeZero;
    CGSize titleLimitSize = CGSizeZero;
    CGSize imageTotalSize = CGSizeZero;// 包含 imageEdgeInsets 那些空间
    CGSize titleTotalSize = CGSizeZero;// 包含 titleEdgeInsets 那些空间
    CGFloat spacingBetweenImageAndTitle = flat(isImageViewShowing && isTitleLabelShowing ? self.spacingBetweenImageAndTitle : 0);// 如果图片或文字某一者没显示，则这个 spacing 不考虑进布局
    CGRect imageFrame = CGRectZero;
    CGRect titleFrame = CGRectZero;
    UIEdgeInsets contentEdgeInsets = UIEdgeInsetsRemoveFloatMin(self.contentEdgeInsets);
    CGSize contentSize = CGSizeMake(CGRectGetWidth(self.bounds) - UIEdgeInsetsGetHorizontalValue(contentEdgeInsets), CGRectGetHeight(self.bounds) - UIEdgeInsetsGetVerticalValue(contentEdgeInsets));
    
    // 图片的布局原则都是尽量完整展示，所以不管 imagePosition 的值是什么，这个计算过程都是相同的
    if (isImageViewShowing) {
        imageLimitSize = CGSizeMake(contentSize.width - UIEdgeInsetsGetHorizontalValue(self.imageEdgeInsets), contentSize.height - UIEdgeInsetsGetVerticalValue(self.imageEdgeInsets));
        CGSize imageSize = self._XJ_imageView.image ? [self._XJ_imageView sizeThatFits:imageLimitSize] : self.currentImage.size;
        imageSize.width = MIN(imageLimitSize.width, imageSize.width);
        imageSize.height = MIN(imageLimitSize.height, imageSize.height);
        imageFrame = CGRectMake(0, 0, imageSize.width, imageSize.height);
        imageTotalSize = CGSizeMake(imageSize.width + UIEdgeInsetsGetHorizontalValue(self.imageEdgeInsets), imageSize.height + UIEdgeInsetsGetVerticalValue(self.imageEdgeInsets));
    }
    
    void (^makesureBoundsPositive)(UIView *) = ^void(UIView *view) {
        CGRect bounds = view.bounds;
        if (CGRectGetMinX(bounds) < 0 || CGRectGetMinY(bounds) < 0) {
            bounds = CGRectMake(0, 0, bounds.size.width, bounds.size.height);
            view.bounds = bounds;
        }
    };
    if (isImageViewShowing) {
        makesureBoundsPositive(self._XJ_imageView);
    }
    if (isTitleLabelShowing) {
        makesureBoundsPositive(self.titleLabel);
    }
    
    if (self.imagePosition == XJButtonImagePositionTop || self.imagePosition == XJButtonImagePositionBottom) {
        
        if (isTitleLabelShowing) {
            titleLimitSize = CGSizeMake(contentSize.width - UIEdgeInsetsGetHorizontalValue(self.titleEdgeInsets), contentSize.height - imageTotalSize.height - spacingBetweenImageAndTitle - UIEdgeInsetsGetVerticalValue(self.titleEdgeInsets));
            CGSize titleSize = [self.titleLabel sizeThatFits:titleLimitSize];
            titleSize.width = MIN(titleLimitSize.width, titleSize.width);
            titleSize.height = MIN(titleLimitSize.height, titleSize.height);
            titleFrame = CGRectMakeWithSize(titleSize);
            titleTotalSize = CGSizeMake(titleSize.width + UIEdgeInsetsGetHorizontalValue(self.titleEdgeInsets), titleSize.height + UIEdgeInsetsGetVerticalValue(self.titleEdgeInsets));
        }
        
        switch (self.contentHorizontalAlignment) {
            case UIControlContentHorizontalAlignmentLeft:
                imageFrame = isImageViewShowing ? CGRectSetX(imageFrame, contentEdgeInsets.left + self.imageEdgeInsets.left) : imageFrame;
                titleFrame = isTitleLabelShowing ? CGRectSetX(titleFrame, contentEdgeInsets.left + self.titleEdgeInsets.left) : titleFrame;
                break;
            case UIControlContentHorizontalAlignmentCenter:
                imageFrame = isImageViewShowing ? CGRectSetX(imageFrame, contentEdgeInsets.left + self.imageEdgeInsets.left + CGFloatGetCenter(imageLimitSize.width, CGRectGetWidth(imageFrame))) : imageFrame;
                titleFrame = isTitleLabelShowing ? CGRectSetX(titleFrame, contentEdgeInsets.left + self.titleEdgeInsets.left + CGFloatGetCenter(titleLimitSize.width, CGRectGetWidth(titleFrame))) : titleFrame;
                break;
            case UIControlContentHorizontalAlignmentRight:
                imageFrame = isImageViewShowing ? CGRectSetX(imageFrame, CGRectGetWidth(self.bounds) - contentEdgeInsets.right - self.imageEdgeInsets.right - CGRectGetWidth(imageFrame)) : imageFrame;
                titleFrame = isTitleLabelShowing ? CGRectSetX(titleFrame, CGRectGetWidth(self.bounds) - contentEdgeInsets.right - self.titleEdgeInsets.right - CGRectGetWidth(titleFrame)) : titleFrame;
                break;
            case UIControlContentHorizontalAlignmentFill:
                if (isImageViewShowing) {
                    imageFrame = CGRectSetX(imageFrame, contentEdgeInsets.left + self.imageEdgeInsets.left);
                    imageFrame = CGRectSetWidth(imageFrame, imageLimitSize.width);
                }
                if (isTitleLabelShowing) {
                    titleFrame = CGRectSetX(titleFrame, contentEdgeInsets.left + self.titleEdgeInsets.left);
                    titleFrame = CGRectSetWidth(titleFrame, titleLimitSize.width);
                }
                break;
            default:
                break;
        }
        
        if (self.imagePosition == XJButtonImagePositionTop) {
            switch (self.contentVerticalAlignment) {
                case UIControlContentVerticalAlignmentTop:
                    imageFrame = isImageViewShowing ? CGRectSetY(imageFrame, contentEdgeInsets.top + self.imageEdgeInsets.top) : imageFrame;
                    titleFrame = isTitleLabelShowing ? CGRectSetY(titleFrame, contentEdgeInsets.top + imageTotalSize.height + spacingBetweenImageAndTitle + self.titleEdgeInsets.top) : titleFrame;
                    break;
                case UIControlContentVerticalAlignmentCenter: {
                    CGFloat contentHeight = imageTotalSize.height + spacingBetweenImageAndTitle + titleTotalSize.height;
                    CGFloat minY = CGFloatGetCenter(contentSize.height, contentHeight) + contentEdgeInsets.top;
                    imageFrame = isImageViewShowing ? CGRectSetY(imageFrame, minY + self.imageEdgeInsets.top) : imageFrame;
                    titleFrame = isTitleLabelShowing ? CGRectSetY(titleFrame, minY + imageTotalSize.height + spacingBetweenImageAndTitle + self.titleEdgeInsets.top) : titleFrame;
                }
                    break;
                case UIControlContentVerticalAlignmentBottom:
                    titleFrame = isTitleLabelShowing ? CGRectSetY(titleFrame, CGRectGetHeight(self.bounds) - contentEdgeInsets.bottom - self.titleEdgeInsets.bottom - CGRectGetHeight(titleFrame)) : titleFrame;
                    imageFrame = isImageViewShowing ? CGRectSetY(imageFrame, CGRectGetHeight(self.bounds) - contentEdgeInsets.bottom - titleTotalSize.height - spacingBetweenImageAndTitle - self.imageEdgeInsets.bottom - CGRectGetHeight(imageFrame)) : imageFrame;
                    break;
                case UIControlContentVerticalAlignmentFill: {
                    if (isImageViewShowing && isTitleLabelShowing) {
                        
                        // 同时显示图片和 label 的情况下，图片高度按本身大小显示，剩余空间留给 label
                        imageFrame = isImageViewShowing ? CGRectSetY(imageFrame, contentEdgeInsets.top + self.imageEdgeInsets.top) : imageFrame;
                        titleFrame = isTitleLabelShowing ? CGRectSetY(titleFrame, contentEdgeInsets.top + imageTotalSize.height + spacingBetweenImageAndTitle + self.titleEdgeInsets.top) : titleFrame;
                        titleFrame = isTitleLabelShowing ? CGRectSetHeight(titleFrame, CGRectGetHeight(self.bounds) - contentEdgeInsets.bottom - self.titleEdgeInsets.bottom - CGRectGetMinY(titleFrame)) : titleFrame;
                        
                    } else if (isImageViewShowing) {
                        imageFrame = CGRectSetY(imageFrame, contentEdgeInsets.top + self.imageEdgeInsets.top);
                        imageFrame = CGRectSetHeight(imageFrame, contentSize.height - UIEdgeInsetsGetVerticalValue(self.imageEdgeInsets));
                    } else {
                        titleFrame = CGRectSetY(titleFrame, contentEdgeInsets.top + self.titleEdgeInsets.top);
                        titleFrame = CGRectSetHeight(titleFrame, contentSize.height - UIEdgeInsetsGetVerticalValue(self.titleEdgeInsets));
                    }
                }
                    break;
            }
        } else {
            switch (self.contentVerticalAlignment) {
                case UIControlContentVerticalAlignmentTop:
                    titleFrame = isTitleLabelShowing ? CGRectSetY(titleFrame, contentEdgeInsets.top + self.titleEdgeInsets.top) : titleFrame;
                    imageFrame = isImageViewShowing ? CGRectSetY(imageFrame, contentEdgeInsets.top + titleTotalSize.height + spacingBetweenImageAndTitle + self.imageEdgeInsets.top) : imageFrame;
                    break;
                case UIControlContentVerticalAlignmentCenter: {
                    CGFloat contentHeight = imageTotalSize.height + titleTotalSize.height + spacingBetweenImageAndTitle;
                    CGFloat minY = CGFloatGetCenter(contentSize.height, contentHeight) + contentEdgeInsets.top;
                    titleFrame = isTitleLabelShowing ? CGRectSetY(titleFrame, minY + self.titleEdgeInsets.top) : titleFrame;
                    imageFrame = isImageViewShowing ? CGRectSetY(imageFrame, minY + titleTotalSize.height + spacingBetweenImageAndTitle + self.imageEdgeInsets.top) : imageFrame;
                }
                    break;
                case UIControlContentVerticalAlignmentBottom:
                    imageFrame = isImageViewShowing ? CGRectSetY(imageFrame, CGRectGetHeight(self.bounds) - contentEdgeInsets.bottom - self.imageEdgeInsets.bottom - CGRectGetHeight(imageFrame)) : imageFrame;
                    titleFrame = isTitleLabelShowing ? CGRectSetY(titleFrame, CGRectGetHeight(self.bounds) - contentEdgeInsets.bottom - imageTotalSize.height - spacingBetweenImageAndTitle - self.titleEdgeInsets.bottom - CGRectGetHeight(titleFrame)) : titleFrame;
                    break;
                case UIControlContentVerticalAlignmentFill: {
                    if (isImageViewShowing && isTitleLabelShowing) {
                        
                        // 同时显示图片和 label 的情况下，图片高度按本身大小显示，剩余空间留给 label
                        imageFrame = CGRectSetY(imageFrame, CGRectGetHeight(self.bounds) - contentEdgeInsets.bottom - self.imageEdgeInsets.bottom - CGRectGetHeight(imageFrame));
                        titleFrame = CGRectSetY(titleFrame, contentEdgeInsets.top + self.titleEdgeInsets.top);
                        titleFrame = CGRectSetHeight(titleFrame, CGRectGetHeight(self.bounds) - contentEdgeInsets.bottom - imageTotalSize.height - spacingBetweenImageAndTitle - self.titleEdgeInsets.bottom - CGRectGetMinY(titleFrame));
                        
                    } else if (isImageViewShowing) {
                        imageFrame = CGRectSetY(imageFrame, contentEdgeInsets.top + self.imageEdgeInsets.top);
                        imageFrame = CGRectSetHeight(imageFrame, contentSize.height - UIEdgeInsetsGetVerticalValue(self.imageEdgeInsets));
                    } else {
                        titleFrame = CGRectSetY(titleFrame, contentEdgeInsets.top + self.titleEdgeInsets.top);
                        titleFrame = CGRectSetHeight(titleFrame, contentSize.height - UIEdgeInsetsGetVerticalValue(self.titleEdgeInsets));
                    }
                }
                    break;
            }
        }
        
        if (isImageViewShowing) {
            imageFrame = CGRectFlatted(imageFrame);
            self._XJ_imageView.frame = imageFrame;
        }
        if (isTitleLabelShowing) {
            titleFrame = CGRectFlatted(titleFrame);
            self.titleLabel.frame = titleFrame;
        }
        
    } else if (self.imagePosition == XJButtonImagePositionLeft || self.imagePosition == XJButtonImagePositionRight) {
        
        if (isTitleLabelShowing) {
            titleLimitSize = CGSizeMake(contentSize.width - UIEdgeInsetsGetHorizontalValue(self.titleEdgeInsets) - imageTotalSize.width - spacingBetweenImageAndTitle, contentSize.height - UIEdgeInsetsGetVerticalValue(self.titleEdgeInsets));
            CGSize titleSize = [self.titleLabel sizeThatFits:titleLimitSize];
            titleSize.width = MIN(titleLimitSize.width, titleSize.width);
            titleSize.height = MIN(titleLimitSize.height, titleSize.height);
            titleFrame = CGRectMakeWithSize(titleSize);
            titleTotalSize = CGSizeMake(titleSize.width + UIEdgeInsetsGetHorizontalValue(self.titleEdgeInsets), titleSize.height + UIEdgeInsetsGetVerticalValue(self.titleEdgeInsets));
        }
        
        switch (self.contentVerticalAlignment) {
            case UIControlContentVerticalAlignmentTop:
                imageFrame = isImageViewShowing ? CGRectSetY(imageFrame, contentEdgeInsets.top + self.imageEdgeInsets.top) : imageFrame;
                titleFrame = isTitleLabelShowing ? CGRectSetY(titleFrame, contentEdgeInsets.top + self.titleEdgeInsets.top) : titleFrame;
                
                break;
            case UIControlContentVerticalAlignmentCenter:
                imageFrame = isImageViewShowing ? CGRectSetY(imageFrame, contentEdgeInsets.top + CGFloatGetCenter(contentSize.height, CGRectGetHeight(imageFrame)) + self.imageEdgeInsets.top) : imageFrame;
                titleFrame = isTitleLabelShowing ? CGRectSetY(titleFrame, contentEdgeInsets.top + CGFloatGetCenter(contentSize.height, CGRectGetHeight(titleFrame)) + self.titleEdgeInsets.top) : titleFrame;
                break;
            case UIControlContentVerticalAlignmentBottom:
                imageFrame = isImageViewShowing ? CGRectSetY(imageFrame, CGRectGetHeight(self.bounds) - contentEdgeInsets.bottom - self.imageEdgeInsets.bottom - CGRectGetHeight(imageFrame)) : imageFrame;
                titleFrame = isTitleLabelShowing ? CGRectSetY(titleFrame, CGRectGetHeight(self.bounds) - contentEdgeInsets.bottom - self.titleEdgeInsets.bottom - CGRectGetHeight(titleFrame)) : titleFrame;
                break;
            case UIControlContentVerticalAlignmentFill:
                if (isImageViewShowing) {
                    imageFrame = CGRectSetY(imageFrame, contentEdgeInsets.top + self.imageEdgeInsets.top);
                    imageFrame = CGRectSetHeight(imageFrame, contentSize.height - UIEdgeInsetsGetVerticalValue(self.imageEdgeInsets));
                }
                if (isTitleLabelShowing) {
                    titleFrame = CGRectSetY(titleFrame, contentEdgeInsets.top + self.titleEdgeInsets.top);
                    titleFrame = CGRectSetHeight(titleFrame, contentSize.height - UIEdgeInsetsGetVerticalValue(self.titleEdgeInsets));
                }
                break;
        }
        
        if (self.imagePosition == XJButtonImagePositionLeft) {
            switch (self.contentHorizontalAlignment) {
                case UIControlContentHorizontalAlignmentLeft:
                    imageFrame = isImageViewShowing ? CGRectSetX(imageFrame, contentEdgeInsets.left + self.imageEdgeInsets.left) : imageFrame;
                    titleFrame = isTitleLabelShowing ? CGRectSetX(titleFrame, contentEdgeInsets.left + imageTotalSize.width + spacingBetweenImageAndTitle + self.titleEdgeInsets.left) : titleFrame;
                    break;
                case UIControlContentHorizontalAlignmentCenter: {
                    CGFloat contentWidth = imageTotalSize.width + spacingBetweenImageAndTitle + titleTotalSize.width;
                    CGFloat minX = contentEdgeInsets.left + CGFloatGetCenter(contentSize.width, contentWidth);
                    imageFrame = isImageViewShowing ? CGRectSetX(imageFrame, minX + self.imageEdgeInsets.left) : imageFrame;
                    titleFrame = isTitleLabelShowing ? CGRectSetX(titleFrame, minX + imageTotalSize.width + spacingBetweenImageAndTitle + self.titleEdgeInsets.left) : titleFrame;
                }
                    break;
                case UIControlContentHorizontalAlignmentRight: {
                    if (imageTotalSize.width + spacingBetweenImageAndTitle + titleTotalSize.width > contentSize.width) {
                        // 图片和文字总宽超过按钮宽度，则优先完整显示图片
                        imageFrame = isImageViewShowing ? CGRectSetX(imageFrame, contentEdgeInsets.left + self.imageEdgeInsets.left) : imageFrame;
                        titleFrame = isTitleLabelShowing ? CGRectSetX(titleFrame, contentEdgeInsets.left + imageTotalSize.width + spacingBetweenImageAndTitle + self.titleEdgeInsets.left) : titleFrame;
                    } else {
                        // 内容不超过按钮宽度，则靠右布局即可
                        titleFrame = isTitleLabelShowing ? CGRectSetX(titleFrame, CGRectGetWidth(self.bounds) - contentEdgeInsets.right - self.titleEdgeInsets.right - CGRectGetWidth(titleFrame)) : titleFrame;
                        imageFrame = isImageViewShowing ? CGRectSetX(imageFrame, CGRectGetWidth(self.bounds) - contentEdgeInsets.right - titleTotalSize.width - spacingBetweenImageAndTitle - imageTotalSize.width + self.imageEdgeInsets.left) : imageFrame;
                    }
                }
                    break;
                case UIControlContentHorizontalAlignmentFill: {
                    if (isImageViewShowing && isTitleLabelShowing) {
                        // 同时显示图片和 label 的情况下，图片按本身宽度显示，剩余空间留给 label
                        imageFrame = CGRectSetX(imageFrame, contentEdgeInsets.left + self.imageEdgeInsets.left);
                        titleFrame = CGRectSetX(titleFrame, contentEdgeInsets.left + imageTotalSize.width + spacingBetweenImageAndTitle + self.titleEdgeInsets.left);
                        titleFrame = CGRectSetWidth(titleFrame, CGRectGetWidth(self.bounds) - contentEdgeInsets.right - self.titleEdgeInsets.right - CGRectGetMinX(titleFrame));
                    } else if (isImageViewShowing) {
                        imageFrame = CGRectSetX(imageFrame, contentEdgeInsets.left + self.imageEdgeInsets.left);
                        imageFrame = CGRectSetWidth(imageFrame, contentSize.width - UIEdgeInsetsGetHorizontalValue(self.imageEdgeInsets));
                    } else {
                        titleFrame = CGRectSetX(titleFrame, contentEdgeInsets.left + self.titleEdgeInsets.left);
                        titleFrame = CGRectSetWidth(titleFrame, contentSize.width - UIEdgeInsetsGetHorizontalValue(self.titleEdgeInsets));
                    }
                }
                    break;
                default:
                    break;
            }
        } else {
            switch (self.contentHorizontalAlignment) {
                case UIControlContentHorizontalAlignmentLeft: {
                    if (imageTotalSize.width + spacingBetweenImageAndTitle + titleTotalSize.width > contentSize.width) {
                        // 图片和文字总宽超过按钮宽度，则优先完整显示图片
                        imageFrame = isImageViewShowing ? CGRectSetX(imageFrame, CGRectGetWidth(self.bounds) - contentEdgeInsets.right - self.imageEdgeInsets.right - CGRectGetWidth(imageFrame)) : imageFrame;
                        titleFrame = isTitleLabelShowing ? CGRectSetX(titleFrame, CGRectGetWidth(self.bounds) - contentEdgeInsets.right - imageTotalSize.width - spacingBetweenImageAndTitle - titleTotalSize.width + self.titleEdgeInsets.left) : titleFrame;
                    } else {
                        // 内容不超过按钮宽度，则靠左布局即可
                        titleFrame = isTitleLabelShowing ? CGRectSetX(titleFrame, contentEdgeInsets.left + self.titleEdgeInsets.left) : titleFrame;
                        imageFrame = isImageViewShowing ? CGRectSetX(imageFrame, contentEdgeInsets.left + titleTotalSize.width + spacingBetweenImageAndTitle + self.imageEdgeInsets.left) : imageFrame;
                    }
                }
                    break;
                case UIControlContentHorizontalAlignmentCenter: {
                    CGFloat contentWidth = imageTotalSize.width + spacingBetweenImageAndTitle + titleTotalSize.width;
                    CGFloat minX = contentEdgeInsets.left + CGFloatGetCenter(contentSize.width, contentWidth);
                    titleFrame = isTitleLabelShowing ? CGRectSetX(titleFrame, minX + self.titleEdgeInsets.left) : titleFrame;
                    imageFrame = isImageViewShowing ? CGRectSetX(imageFrame, minX + titleTotalSize.width + spacingBetweenImageAndTitle + self.imageEdgeInsets.left) : imageFrame;
                }
                    break;
                case UIControlContentHorizontalAlignmentRight:
                    imageFrame = isImageViewShowing ? CGRectSetX(imageFrame, CGRectGetWidth(self.bounds) - contentEdgeInsets.right - self.imageEdgeInsets.right - CGRectGetWidth(imageFrame)) : imageFrame;
                    titleFrame = isTitleLabelShowing ? CGRectSetX(titleFrame, CGRectGetWidth(self.bounds) - contentEdgeInsets.right - imageTotalSize.width - spacingBetweenImageAndTitle - self.titleEdgeInsets.right - CGRectGetWidth(titleFrame)) : titleFrame;
                    break;
                case UIControlContentHorizontalAlignmentFill: {
                    if (isImageViewShowing && isTitleLabelShowing) {
                        // 图片按自身大小显示，剩余空间由标题占满
                        imageFrame = CGRectSetX(imageFrame, CGRectGetWidth(self.bounds) - contentEdgeInsets.right - self.imageEdgeInsets.right - CGRectGetWidth(imageFrame));
                        titleFrame = CGRectSetX(titleFrame, contentEdgeInsets.left + self.titleEdgeInsets.left);
                        titleFrame = CGRectSetWidth(titleFrame, CGRectGetMinX(imageFrame) - self.imageEdgeInsets.left - spacingBetweenImageAndTitle - self.titleEdgeInsets.right - CGRectGetMinX(titleFrame));
                        
                    } else if (isImageViewShowing) {
                        imageFrame = CGRectSetX(imageFrame, contentEdgeInsets.left + self.imageEdgeInsets.left);
                        imageFrame = CGRectSetWidth(imageFrame, contentSize.width - UIEdgeInsetsGetHorizontalValue(self.imageEdgeInsets));
                    } else {
                        titleFrame = CGRectSetX(titleFrame, contentEdgeInsets.left + self.titleEdgeInsets.left);
                        titleFrame = CGRectSetWidth(titleFrame, contentSize.width - UIEdgeInsetsGetHorizontalValue(self.titleEdgeInsets));
                    }
                }
                    break;
                default:
                    break;
            }
        }
        
        if (isImageViewShowing) {
            imageFrame = CGRectFlatted(imageFrame);
            self._XJ_imageView.frame = imageFrame;
        }
        if (isTitleLabelShowing) {
            titleFrame = CGRectFlatted(titleFrame);
            self.titleLabel.frame = titleFrame;
        }
    }
}

-(CAGradientLayer *)gradientLayer{
    if(!_gradientLayer){
        _gradientLayer = [CAGradientLayer layer];
    }
    return _gradientLayer;
}
- (void)setHighlighted:(BOOL)highlighted{}

@end
