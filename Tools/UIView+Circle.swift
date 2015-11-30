//
//  UIView+HeartStyle.swift
//  xin
//
//  Created by zhangxi on 15/7/19.
//  Copyright (c) 2015年 zhangxi. All rights reserved.
//

import UIKit


extension UIView
{

    func radius(adius:Float)
    {
        self.clipsToBounds = true
        self.layer.cornerRadius = CGFloat(adius)
    }
    
    func makeCircle()
    {
        self.clipsToBounds = true
        self.layer.cornerRadius = CGFloat(self.bounds.size.width/2)
        self.layer.borderColor = UIColor.whiteColor().CGColor
        self.layer.borderWidth = 1.5
    }
    
    func makeBorder()
    {
        self.clipsToBounds = true
        self.layer.cornerRadius = CGFloat(self.bounds.size.height/2)
        self.layer.borderColor = UIColor(rgb: 106, g: 189, b: 53).CGColor
        self.layer.borderWidth = 0.5
    }
    
}
