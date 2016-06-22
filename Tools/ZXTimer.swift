//
//  ZXTimer.swift
//  xin
//
//  Created by zhangxi on 15/6/5.
//  Copyright (c) 2015年 zhangxi. All rights reserved.
//

import Foundation

public class ZXTimer
{
    private static let defaultIdentifiery = "me.zhangxi.timer.default"
    private static var flags = [String:NSDate]()
    
    public class func flag(identifier:String = defaultIdentifiery)
    {
        flags[identifier] = NSDate()
    }
    public class func timeInterval(identifier:String = defaultIdentifiery) -> NSTimeInterval
    {
        if let date = flags[identifier]
        {
            return NSDate().timeIntervalSinceDate(date)
        }else
        {
            return 0
        }
    }
}
