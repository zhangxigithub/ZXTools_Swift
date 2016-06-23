//
//  String+Heart.swift
//  xin
//
//  Created by zhangxi on 15/7/31.
//  Copyright (c) 2015年 zhangxi. All rights reserved.
//

import Foundation

public extension String
{
    public func stringRemovedLastChar()->String
    {
        let last1 = self.endIndex.advancedBy(-1)
        return self.substringToIndex(last1)
    }
    
    public func encodeURL() -> NSURL
    {
        return NSURL(string: self.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!)!;
    }
}