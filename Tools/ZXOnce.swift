//
//  ZXFunctions.swift
//  demo
//
//  Created by zhangxi on 12/3/15.
//  Copyright © 2015 zhangxi. All rights reserved.
//

import UIKit

public class ZXOnce {

    public class func run(key:String,once:(()->Void)?,another:(()->Void)?)
    {
        let realKey = key+".zhangxi.once"
        if let _  = NSUserDefaults.standardUserDefaults().objectForKey(realKey)
        {
            another?()
        }else
        {
            once?()
            NSUserDefaults.standardUserDefaults().setObject("finished", forKey: realKey)
            NSUserDefaults.standardUserDefaults().synchronize()
        }
    }
    public class func clean(key:String)
    {
        let realKey = key+".zhangxi.once"
        NSUserDefaults.standardUserDefaults().removeObjectForKey(realKey)
        NSUserDefaults.standardUserDefaults().synchronize()
    }
}


