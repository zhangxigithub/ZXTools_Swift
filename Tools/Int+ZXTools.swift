//
//  UILabel+MultipleColor.swift
//  xin
//
//  Created by zhangxi on 15/7/25.
//  Copyright (c) 2015年 zhangxi. All rights reserved.
//

import UIKit

public extension Int
{
    
    public func times(action:()->Void)
    {
        for _ in 0 ..< self
        {
            action()
        }
    }
}
