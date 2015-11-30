//
//  UIWebView+JS.swift
//  BrainWebView
//
//  Created by zhangxi on 15/4/23.
//  Copyright (c) 2015年 zhangxi. All rights reserved.
//

import UIKit

extension UIWebView
{
    
    func injectJS(name: String?, ofType ext: String?) -> String?
    {
        let path = NSBundle.mainBundle().pathForResource(name, ofType:ext)
        let js   = try? NSString(contentsOfFile: path!, encoding: NSUTF8StringEncoding)
        
        let find = NSString(format:"var script = document.createElement('script');script.type = 'text/javascript';script.text = %@;document.getElementsByTagName('body')[0].appendChild(script);",js!) as String
        
        //注入js
        return self.stringByEvaluatingJavaScriptFromString(find)
    }
    
    
    func js(theJS:String!) -> String?
    {
        return self.stringByEvaluatingJavaScriptFromString(theJS)
    }
    
    
    

    func loadURL(url:NSURL?)
    {
        if url != nil
        {
            let request = NSURLRequest(URL: url!)
            self.loadRequest(request)
        }
    }
    func loadURLString(s:String)
    {
        if let URL = NSURL(string: s)
        {
            let request = NSURLRequest(URL: URL)
            self.loadRequest(request)
        }
    }
    func loadFile(name: String?, ofType ext: String?)
    {
        let path = NSBundle.mainBundle().pathForResource(name, ofType:ext)
        let content   = (try! NSString(contentsOfFile: path!, encoding: NSUTF8StringEncoding)) as String
    
        self.loadHTMLString(content, baseURL: NSURL(string: "")!)
    }
    func webTitle() -> String
    {
        let value = self.stringByEvaluatingJavaScriptFromString("document.title")
        return value ?? ""
    }
    func webDescription() -> String
    {
        let value = self.stringByEvaluatingJavaScriptFromString("document.getElementById(\"description\").content")
        return value ?? ""
    }

    
}