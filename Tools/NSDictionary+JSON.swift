//
//  NSDictionary+JSON.swift
//  yun
//
//  Created by zhangxi on 15/3/30.
//  Copyright (c) 2015年 me.zhangxi. All rights reserved.
//

import Foundation


public extension NSDictionary
{

    public func JSONString()->String?
    {
        let data = try? JSONSerialization.data(withJSONObject: self, options: JSONSerialization.WritingOptions.prettyPrinted)
        if data == nil
        {
            return nil
        }
        let strJson = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
        return strJson as? String
    }
    
}

