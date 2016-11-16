//
//  AppDelegate.swift
//  demo
//
//  Created by zhangxi on 11/30/15.
//  Copyright © 2015 zhangxi. All rights reserved.
//

import UIKit
import CoreLocation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {


        print("abcd".firstChar())
        print("abcd".lastChar())
        
        print("abcd".removingFirstChar())
        print("abcd".removingLastChar())
        
        print(["a","b","c"].joined(separator: "x"))
        
        5.times {
            print("哈哈哈哈")
        }
        
        ZXOnce.run("first launch", once: { 
            print("first")
            }) { 
            print("not first")
        }
        
        
        ZXLocationManager.shared.easyLocate(locate: { (location) in
            
            print("easy location \(location)")
            
        }, reverse: {(placemark)in
        
            print("easy reverse country \(placemark.country)")
            print("easy reverse provience \(placemark.administrativeArea)")
            print("easy reverse city\(placemark.locality)")
            
        })
        
        
        ZXLocationManager.shared.locate(accuracy: kCLLocationAccuracyBest, locate: nil, reverse: {(marks) in
        
            print("location finish")
            //print(marks as Any)
        })
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            print("0.1 .... \(ZXLocationManager.shared.location)")
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            print("0.5 .... \(ZXLocationManager.shared.location)")
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            print("1.0 .... \(ZXLocationManager.shared.location)")
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            print("1.5 .... \(ZXLocationManager.shared.location)")
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            print("2.0 .... \(ZXLocationManager.shared.location)")
        }

        
        return true

    }
}

