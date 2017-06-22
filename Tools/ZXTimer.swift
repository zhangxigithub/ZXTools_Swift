//
//  ZXTimer.swift
//  xin
//
//  Created by zhangxi on 15/6/5.
//  Copyright (c) 2015年 zhangxi. All rights reserved.
//

import Foundation

open class ZXTimer
{
    //fileprivate static let defaultIdentifiery = "me.zhangxi.timer.default"
    fileprivate static var flags = [String:Date]()
    
    open class func flag(_ identifier:String = "me.zhangxi.timer.default")
    {
        flags[identifier] = Date()
    }
    open class func timeInterval(_ identifier:String = "me.zhangxi.timer.default") -> TimeInterval
    {
        if let date = flags[identifier]
        {
            return Date().timeIntervalSince(date)
        }else
        {
            return 0
        }
    }
}
