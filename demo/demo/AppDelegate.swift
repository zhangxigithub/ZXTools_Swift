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


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        
        ZXOnce.run("first launch", once: { 
            print("first")
            }) { 
            print("not first")
        }
        
        ZXLocationManager.sharedManager.findCity { (city) in
            print("find city : \(city)")
        }

//        ZXLocationManager.sharedManager.locate { (manager, location) in
//         
//            manager.stopUpdatingLocation()
//            
//            ZXLocationManager.sharedManager.reverseGeocodeLocation(location!, handler: { (marks, error) in
//                print(marks)
//            })
//            
//            print(location)
//        }
        
        return true

    }
}

