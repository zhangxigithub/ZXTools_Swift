//
//  NSObject+Fire.swift
//  demo
//
//  Created by zhangxi on 11/30/15.
//  Copyright © 2015 zhangxi. All rights reserved.
//

import UIKit

extension NSObject
{
    func fire(action:Selector,delay:NSTimeInterval,target:AnyObject) -> NSTimer
    {
        return NSTimer.scheduledTimerWithTimeInterval(delay, target: target, selector: action, userInfo: nil, repeats: false)
    }
    func fire(action:Selector,delay:NSTimeInterval) -> NSTimer
    {
        return NSTimer.scheduledTimerWithTimeInterval(delay, target: self, selector: action, userInfo: nil, repeats: false)
    }
    func fire(action:Selector) -> NSTimer
    {
        return NSTimer.scheduledTimerWithTimeInterval(0, target: self, selector: action, userInfo: nil, repeats: false)
    }
}
