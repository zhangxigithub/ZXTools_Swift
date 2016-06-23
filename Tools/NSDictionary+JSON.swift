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
        let data = try? NSJSONSerialization.dataWithJSONObject(self, options: NSJSONWritingOptions.PrettyPrinted)
        if data == nil
        {
            return nil
        }
        let strJson = NSString(data: data!, encoding: NSUTF8StringEncoding)
        return strJson as? String
    }
    
}

