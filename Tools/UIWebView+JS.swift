//
//  UIWebView+JS.swift
//  BrainWebView
//
//  Created by zhangxi on 15/4/23.
//  Copyright (c) 2015年 zhangxi. All rights reserved.
//

import UIKit

public extension UIWebView
{
    
    func injectJS(_ name: String?, ofType ext: String?) -> String?
    {
        let path = Bundle.main.path(forResource: name, ofType:ext)
        let js   = try? NSString(contentsOfFile: path!, encoding: String.Encoding.utf8.rawValue)
        
        let find = NSString(format:"var script = document.createElement('script');script.type = 'text/javascript';script.text = %@;document.getElementsByTagName('body')[0].appendChild(script);",js!) as String
        
        //注入js
        return self.stringByEvaluatingJavaScript(from: find)
    }
    
    
    func js(_ theJS:String!) -> String?
    {
        return self.stringByEvaluatingJavaScript(from: theJS)
    }
    

    func loadURL(_ url:URL?)
    {
        if url != nil
        {
            let request = URLRequest(url: url!)
            self.loadRequest(request)
        }
    }
    func loadURLString(_ s:String)
    {
        if let URL = URL(string: s)
        {
            let request = URLRequest(url: URL)
            self.loadRequest(request)
        }
    }
    func loadFile(_ name: String?, ofType ext: String?)
    {
        let path = Bundle.main.path(forResource: name, ofType:ext)
        let content   = (try! NSString(contentsOfFile: path!, encoding: String.Encoding.utf8.rawValue)) as String
    
        self.loadHTMLString(content, baseURL: URL(string: "")!)
    }
    func webTitle() -> String
    {
        let value = self.stringByEvaluatingJavaScript(from: "document.title")
        return value ?? ""
    }
    func webDescription() -> String
    {
        let value = self.stringByEvaluatingJavaScript(from: "document.getElementById(\"description\").content")
        return value ?? ""
    }

    
}
