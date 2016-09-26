//
//  NSDate+Today.swift
//  xin
//
//  Created by zhangxi on 9/1/15.
//  Copyright (c) 2015 zhangxi. All rights reserved.
//

import Foundation

public extension Date
{
    
    public func isToday() -> Bool
    {
        
        let second = Int(Date().timeIntervalSince1970) - (Int(Date().timeIntervalSince1970) % Int(60*60*24))
        
        if Int(self.timeIntervalSince1970) > second
        {
            return true
        }else
        {
            return false
        }
    }
}
