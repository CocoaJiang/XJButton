//
//  XJButton+Swift.swift
//  XJEasyButton
//
//  Created by mac on 2025/7/10.
//

import Foundation
// MARK: Swift 开发者调用
extension XJButton {
    
    @discardableResult @nonobjc
    public func setSelectedTitle(title: String?) -> XJButton {
        return self.setSeletedTitle(title)
    }
    
    @discardableResult @nonobjc
    public func setTitle(title: String?) -> XJButton {
        return self.setTitle(title)
    }
    
    @discardableResult @nonobjc
    public func setSelectedImage(image: UIImage?) -> XJButton {
        return self.setSeletedImage(image)
    }
    
    @discardableResult @nonobjc
    public func setImage(image: UIImage?) -> XJButton {
        return self.setImage(image)
    }
    
    @discardableResult @nonobjc
    public func setClickAction(action: ((XJButton) -> Void)?) -> XJButton {
        return self.setAction(action)
    }
    
    @discardableResult @nonobjc
    public func setFont(font: UIFont?) -> XJButton {
        return self.setFont(font)
    }
    
    @discardableResult @nonobjc
    public func setTextColor(color: UIColor?) -> XJButton {
        return self.setTextColor(color)
    }
    
    @discardableResult @nonobjc
    public func setDisabledTextColor(color: UIColor?) -> XJButton {
        return self.setDisabledTextColor(color)
    }
    
    @discardableResult @nonobjc
    public func setBgColor(color: UIColor?) -> XJButton {
        return self.setBgColor(color)
    }
    
    @discardableResult @nonobjc
    public func setDisabledBgColor(color: UIColor?) -> XJButton {
        return self.setDisabledBgColor(color)
    }
    
    @discardableResult @nonobjc
    public func setImagePosition(imagePosition: XJButtonImagePosition) -> XJButton {
        return self.setImagePosition(imagePosition)
    }
    
    @discardableResult @nonobjc
    public func setSpacingBetweenImageAndTitle(spacing: CGFloat) -> XJButton {
        return self.setSpacingBetweenImageAndTitle(spacing)
    }
    
    @discardableResult @nonobjc
    public func setCornerRadius(cornerRadius: CGFloat) -> XJButton {
        return self.setCornerRadius(cornerRadius)
    }
    
    @discardableResult @nonobjc
    public func setTheSameAppearanceAsButton(button: UIButton?) -> XJButton {
        return self.setTheSameAppearanceAsButton(button)
    }
    
    @discardableResult @nonobjc
    public func setContentEdgeInsets(edgeInsets: UIEdgeInsets) -> XJButton {
        return self.setContentEdgeInsets(edgeInsets)
    }
    
    @discardableResult @nonobjc
    public func setExpandClickArea(expandClickArea: UIEdgeInsets) -> XJButton {
        return self.setExpandClickArea(expandClickArea)
    }
    
    @discardableResult @nonobjc
    public func setOneOrMoreCorner(corner: UIRectCorner, oneOrMoreCornerRadius: CGFloat) -> XJButton {
        return self.setOneOrMoreCorner(corner, oneOrMoreCornerRadius)
    }
    
    @discardableResult @nonobjc
    public func setGradation(colors: [UIColor]?, type: XJButtonGradientType) -> XJButton {
        return self.setGradation(colors, type)
    }
    
    @discardableResult @nonobjc
    public func setAttributedString(attributedString: NSMutableAttributedString?) -> XJButton {
        return self.setAttributedString(attributedString)
    }
}
