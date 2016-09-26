//
//  NSUserDefaults+Convenice.swift
//  xin
//
//  Created by zhangxi on 15/7/15.
//  Copyright (c) 2015年 zhangxi. All rights reserved.
//

import Foundation


public extension UserDefaults
{
    public subscript(key : String) -> AnyObject?
        {
        get
        {
            return UserDefaults.standard.object(forKey: key) as AnyObject?
        }
        set(newValue)
        {
            UserDefaults.standard.set(newValue, forKey: key)
            UserDefaults.standard.synchronize()
        }
    }
}
