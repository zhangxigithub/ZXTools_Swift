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
        if let originURL = NSURL(string: self)
        {
            return originURL
        }else
        {
            if let url = NSURL(string: self.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!)
            {
                // 把URL最后一个#解码，还不确定会不会有问题 张玺
                if  let range = url.absoluteString?.rangeOfString("%23", options: NSStringCompareOptions.BackwardsSearch)
                {
                    let newURL = url.absoluteString?.stringByReplacingCharactersInRange(range, withString: "#")
                    return NSURL(string: newURL!)!
                }else
                {
                    return url
                }
                
            }else
            {
                return NSURL(string: "")!
            }
        }
    }
}
