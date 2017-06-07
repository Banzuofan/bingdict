//
//  ColorHelper.swift
//  BINGDict
//
//  Created by YXLONG on 2017/6/6.
//  Copyright © 2017年 MST. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    /**
     * Initializes and returns a color object for the given RGB hex integer.
     */
    public convenience init(rgb: Int) {
        self.init(
            red:   CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgb & 0x00FF00) >> 8)  / 255.0,
            blue:  CGFloat((rgb & 0x0000FF) >> 0)  / 255.0,
            alpha: 1)
    }
    
    public convenience init(colorString: String) {
        var colorInt: UInt32 = 0
        Scanner(string: colorString).scanHexInt32(&colorInt)
        self.init(rgb: (Int) (colorInt))
    }
}

extension UIColor {
    
    /// 主题颜色
    public class var themeColor: UIColor {
        return UIColor(colorString: "19a79d")
    }
    
    /// 搜索框提示文本颜色
    public class var searchBoxPlaceholder: UIColor {
        return UIColor(colorString: "b1b8cf")
    }
    
    /// 搜索框背景颜色
    public class var searchBarBgColor: UIColor {
        return UIColor(colorString: "f7f8fb")
    }
}
