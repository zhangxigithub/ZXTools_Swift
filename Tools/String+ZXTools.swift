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
    func fromBase64() -> String
    {
        let data = Data(base64Encoded: self, options: NSData.Base64DecodingOptions(rawValue: 0))
        return String(data: data!, encoding: String.Encoding.utf8)!
    }
    
    func toBase64() -> String
    {
        let data = self.data(using: String.Encoding.utf8)
        return data!.base64EncodedString(options: NSData.Base64EncodingOptions(rawValue: 0))
    }
    public func firstChar()->String
    {
        return self.substring(to: self.index(after: self.startIndex))
    }
    
    public func lastChar()->String
    {
        return self.substring(from: self.index(before: self.endIndex))
    }
    
    public func removingFirstChar()->String
    {
        return self.substring(from: self.index(after: self.startIndex))
    }
    
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
