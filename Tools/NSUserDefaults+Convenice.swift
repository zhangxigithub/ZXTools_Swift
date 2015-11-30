//
//  NSUserDefaults+Convenice.swift
//  xin
//
//  Created by zhangxi on 15/7/15.
//  Copyright (c) 2015年 zhangxi. All rights reserved.
//

import Foundation


extension NSUserDefaults
{
    subscript(key : String) -> AnyObject?
        {
        get
        {
            return NSUserDefaults.standardUserDefaults().objectForKey(key)
        }
        set(newValue)
        {
            NSUserDefaults.standardUserDefaults().setObject(newValue, forKey: key)
            NSUserDefaults.standardUserDefaults().synchronize()
        }
    }
}