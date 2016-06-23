//
//  UIColor+ShortName.swift
//  ChinasoClient
//
//  Created by zhangxi on 15/5/21.
//  Copyright (c) 2015年 Chinaso. All rights reserved.
//

import UIKit

public extension UIColor
{

    public convenience init(rgb r:Int,g:Int,b:Int) {
        self.init(red: CGFloat(r)/CGFloat(255.0), green: CGFloat(g)/CGFloat(255.0),blue: CGFloat(b)/CGFloat(255.0),alpha: 1)
    }
    
    public convenience init(rgba r:Int,g:Int,b:Int,a:Float) {
        self.init(red: CGFloat(r)/CGFloat(255.0), green: CGFloat(g)/CGFloat(255.0),blue: CGFloat(b)/CGFloat(255.0),alpha: CGFloat(a))
    }
    

    public convenience init(hexString: String) {
       
        var red:   CGFloat = 0.0
        var green: CGFloat = 0.0
        var blue:  CGFloat = 0.0
        var alpha: CGFloat = 1.0
        
        var color = hexString
        if color.hasPrefix("#") == true
        {
            color = color.substringFromIndex(color.startIndex.advancedBy(1))
        }
        
        var hex:UInt64 = 0
        
        if NSScanner(string: color).scanHexLongLong(&hex)
        {
            if color.characters.count == 6
            {
                red   = CGFloat((hex & 0x8FF0000) >> 16)  / 255.0
                green = CGFloat((hex & 0x00FF00) >> 8)    / 255.0
                blue  = CGFloat(hex & 0x0000FF)           / 255.0
            }else if color.characters.count == 8
            {
                red   = CGFloat((hex & 0xFF000000) >> 24) / 255.0
                green = CGFloat((hex & 0x00FF0000) >> 16) / 255.0
                blue  = CGFloat((hex & 0x0000FF00) >> 8)  / 255.0
                alpha = CGFloat(hex & 0x000000FF)         / 255.0
            }
        }else
        {
        }
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }

}