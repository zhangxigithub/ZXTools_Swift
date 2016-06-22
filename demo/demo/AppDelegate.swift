//
//  AppDelegate.swift
//  demo
//
//  Created by zhangxi on 11/30/15.
//  Copyright © 2015 zhangxi. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

        
        ZXOnce.run("first launch", once: { 
            print("first")
            }) { 
            print("not first")
        }
        

        
        return true

    }
}

