//
//  ZXFunctions.swift
//  demo
//
//  Created by zhangxi on 12/3/15.
//  Copyright © 2015 zhangxi. All rights reserved.
//

import UIKit

open class ZXOnce {

    open class func run(_ key:String,once:(()->Void)?,another:(()->Void)?)
    {
        let realKey = key+".zhangxi.once"
        if let _  = UserDefaults.standard.object(forKey: realKey)
        {
            another?()
        }else
        {
            once?()
            UserDefaults.standard.set("finished", forKey: realKey)
            UserDefaults.standard.synchronize()
        }
    }
    open class func clean(_ key:String)
    {
        let realKey = key+".zhangxi.once"
        UserDefaults.standard.removeObject(forKey: realKey)
        UserDefaults.standard.synchronize()
    }
}


