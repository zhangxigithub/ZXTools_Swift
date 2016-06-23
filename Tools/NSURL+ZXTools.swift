//
//  NSURL+ZXTools.swift
//  demo
//
//  Created by zhangxi on 6/23/16.
//  Copyright © 2016 zhangxi. All rights reserved.
//

import Foundation

public extension NSURL
{
    public subscript(key:String) -> String
        {
        get{
            return parameters()[key] ?? ""
        }
    }
    
    public func parameters()-> Dictionary<String,String>
    {
        var params = [String:String]()
        let query = self.query ?? ""
        for paramString in query.componentsSeparatedByString("&")
        {
            let paramPair = paramString.componentsSeparatedByString("=")
            if paramPair.count == 2
            {
                let key     = paramPair[0].stringByRemovingPercentEncoding ?? ""
                let value   = paramPair[1].stringByRemovingPercentEncoding ?? ""
                params[key] = value
            }
        }
        return params
    }
    
}