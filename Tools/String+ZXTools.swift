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
    public func removingLastChar()->String
    {
        return self.substring(to: self.index(before: self.endIndex))
    }
    
    public func encodeURL() -> URL?
    {
        if let originURL = URL(string: self)
        {
            return originURL
        }else
        {
            if let url = URL(string: self.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!)
            {
                return url
            }else
            {
                return nil
            }
        }
    }
}
