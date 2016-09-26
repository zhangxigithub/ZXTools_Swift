//
//  UILabel+MultipleColor.swift
//  xin
//
//  Created by zhangxi on 15/7/25.
//  Copyright (c) 2015年 zhangxi. All rights reserved.
//

import UIKit

public extension UILabel
{
    
    public func setMultipleColorText(_ texts:Array<(color:UIColor,text:String)>)
    {
        
        var string = ""
        for text in texts
        {
            string =  string + (text.text)
        }
        let aString = NSMutableAttributedString(string: string)
        
        var location = 0
        for text in texts
        {
            let length = (text.text as NSString).length
            aString.addAttribute(NSForegroundColorAttributeName, value: text.color, range: NSMakeRange(location,length))
            location += length
        }
        self.attributedText = aString
    }
}
