# XJButton


### API介绍

#### 设置选中状态下的文字
`@property (nonatomic,copy,readonly) XJButton * (^setSeletedTitle) (NSString * text);
`

#### 设置标题
`@property (nonatomic,copy,readonly) XJButton * (^setTitle) (NSString * text);
`

#### 设置选中图片
`@property(nonatomic,copy,readonly) XJButton *(^setSeletedImage)(UIImage *image);
`

#### 设置普通图片
`@property(nonatomic,copy,readonly) XJButton *(^setImage)(UIImage *image);
`
#### 设置事件
`@property(nonatomic,copy,readonly) XJButton *(^setAction)(void(^)(XJButton *button));`

####  设置字体
`@property(nonatomic,copy,readonly) XJButton *(^setFont)(UIFont *font);`

#### 设置字体颜色
`@property(nonatomic,copy,readonly) XJButton *(^setTextColor)(UIColor *color);`

#### 设置背景颜色
`@property(nonatomic,copy,readonly) XJButton *(^setBgColor)(UIColor *color);`

#### 设置布局方式
`@property(nonatomic,copy,readonly) XJButton *(^setImagePosition)(XJButtonImagePosition imagePosition);`

#### 图片距离文字的距离
`@property(nonatomic,copy,readonly) XJButton *(^setSpacingBetweenImageAndTitle)(CGFloat spacingBetweenImageAndTitle);`

#### 设置圆角 备注:如果是 -1 则自动切半圆
`@property(nonatomic,copy,readonly) XJButton *(^setCornerRadius)(CGFloat cornerRadius);`

#### 支持格式copy 其他Button的格式包含如下 :  copy 字体颜色 . copy 背景颜色    copy 字体
`@property(nonatomic,copy,readonly) XJButton *(^setTheSameAppearanceAsButton)(UIButton *button);`

#### 设置内边距
`@property(nonatomic,copy,readonly) XJButton *(^setContentEdgeInsets)(UIEdgeInsets edgeInsets);`

#### 设置点击区域_一般做扩大点击区域来用 参数类似  UIEdgeInsetsMake(-10, -10, -10, -10); 表示,上下左右各扩大10
`@property(nonatomic,copy,readonly) XJButton *(^setExpandClickArea)(UIEdgeInsets expandClickArea);`

#### 设置某一个位置的圆角 优先级要高于 cornerRadius; 默认半圆, 可根据 oneOrMorecornerRadius  == -1 则是半圆 与 cornerRadius 属性互斥 ，调用者只需要调用一个即可
`@property(nonatomic,copy,readonly) XJButton *(^setOneOrMoreCorner)(UIRectCorner corner,CGFloat oneOrMorecornerRadius);`

#### 设置button 背景色 渐变 颜色值，渐变方向。
`@property(nonatomic,copy,readonly) XJButton *(^setGradation)(NSArray <UIColor *> *colors,XJButtonGradientType type);`

#### 设置属性字符串
`@property(nonatomic,copy,readonly) XJButton *(^setAttributedString)(NSMutableAttributedString *attributedString);`


### 举个🌰-swift

`
let button = XJButton();
button.setFont(.SPMFont(fontSize: 14))
                  .setCornerRadius(-1)
                  .setTextColor(.white)
                  .setBgColor(.appRedColor)
                  .setContentEdgeInsets(UIEdgeInsets(top: 8, left: 35, bottom: 8, right: 35)).sizeToFit()
`




### 支持 `cocoapods` 引入，目前执行pod search 搜索不到，但是可以倒入

```
target 'testaaaa' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  pod 'XJEasyButton', '0.1.3'
end

```
如果是swift 的话 ，可以为这个Button 写一个扩展 ,调用更加方便。例如

``` 
   ///  创建一个button
    /// - Parameters:
    ///   - size: 文字大小
    ///   - type: 文字类型
    ///   - textColorHex: 文字颜色
    ///   - alpha: 透明度
    ///   - title: 标题
    ///   - imageName: 图片名称
    ///   - postion: 布局类型
    ///   - spacing: 间距
    convenience init(size: Int? = 14, type: MCFontCategory.typeface? = .Regular, textColorHex: String? = nil, alpha: CGFloat = 1.0, title:String? = nil, imageName:String? = nil, postion : XJButtonImagePosition? = nil,spacing:CGFloat = 1, seletedImage:String? = nil,clickAction:((XJButton)->())? = nil) {
        self.init(type: .custom);
        if let textColorHex = textColorHex {
            _ = self.setTextColor(UIColor(hexString: textColorHex,alpha));
        }
        if  let postion = postion {
            _ = self.setImagePosition(postion).setSpacingBetweenImageAndTitle(spacing);
        }
        if let size = size , let type = type {
            _ = self.setFont(MCFontPF(size, type));
        }
        if let title = title {
            _ = self.setTitle(title);
        }
        if let imageName = imageName {
            _ = self.setImage(UIImage(named: imageName) ?? UIImage())
        }
        if let seletedImage = seletedImage {
            _ = self.setSeletedImage(UIImage(named: seletedImage) ?? UIImage())
        }
        if let clickAction = clickAction{
            _ = self.setAction(clickAction);
        }
        
        self.translatesAutoresizingMaskIntoConstraints = false;
    }
```