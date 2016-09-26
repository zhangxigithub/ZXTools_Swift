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
        let last1 = self.characters.index(self.endIndex, offsetBy: -1)
        return self.substring(to: last1)
    }
    
    public func encodeURL() -> URL
    {
        return URL(string: self.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!)!;
    }
}
