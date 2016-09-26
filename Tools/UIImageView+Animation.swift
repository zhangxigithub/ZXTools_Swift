//
//  UIImageView+Animation.swift
//  xin
//
//  Created by 张玺 on 15/7/12.
//  Copyright (c) 2015年 zhangxi. All rights reserved.
//

import UIKit


public extension UIImageView
{
    
    public func animation(_ imageNames:Array<String>,time:TimeInterval=0.1,repeat:Int=0)
    {
        var images = [UIImage]()
        
        for name in imageNames
        {
            let image = UIImage(named: name)
            images.append(image!)
        }
        self.animationImages = images
        self.animationDuration = TimeInterval(time * TimeInterval(imageNames.count))
        self.animationRepeatCount = `repeat`
        self.startAnimating()
    }
}
