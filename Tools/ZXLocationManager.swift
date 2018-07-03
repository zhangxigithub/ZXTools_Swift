//
//  ZXLocationManager.swift
//  demo
//
//  Created by zhangxi on 6/23/16.
//  Copyright © 2016 zhangxi. All rights reserved.
//

import Foundation
import CoreLocation

public typealias LocateHandler  = ([CLLocation]) -> Void
public typealias ReverseHandler = ([CLPlacemark]?) -> Void

public typealias EasyLocateHandler  = (CLLocation) -> Void
public typealias EasyReverseHandler = (CLPlacemark) -> Void

open class ZXLocationManager : NSObject,CLLocationManagerDelegate
{
    open static let shared = ZXLocationManager()
    
    let locationManager = CLLocationManager()
    let geocoder        = CLGeocoder()
    
    
    open var placemark: CLPlacemark?
    open var location : CLLocation?
    
    
    var locateHandler   : LocateHandler?
    var reverseHandler  : ReverseHandler?
    
    var easyLocateHandler   : EasyLocateHandler?
    var easyReverseHandler  : EasyReverseHandler?
    
    /// 逆地理编码的语音指定器，默认为 nil，即使用系统默认的。
    var reverseLanguageDesignator: String?
    
    /// 是否强制指定了逆地理编码的语音指定器。
    fileprivate var forceReverseLanuage: Bool {
        return reverseLanguageDesignator != nil
    }
    
    override init() {
        super.init()
        locationManager.delegate = self
    }

    open func locate(accuracy desiredAccuracy:CLLocationAccuracy = kCLLocationAccuracyBest, locate:LocateHandler? = nil,reverse:ReverseHandler? = nil)
    {
        self.locateHandler  = locate
        self.reverseHandler = reverse
        
        locationManager.desiredAccuracy = desiredAccuracy
        
        locationManager.requestWhenInUseAuthorization()
    }
    
    open func easyLocate(locate:EasyLocateHandler? = nil,reverse:EasyReverseHandler? = nil)
    {
        self.easyLocateHandler  = locate
        self.easyReverseHandler = reverse
        
        locationManager.desiredAccuracy = kCLLocationAccuracyKilometer
        
        let status = CLLocationManager.authorizationStatus()
        if status == .authorizedAlways || status == .authorizedWhenInUse {
            if #available(iOS 9, *) {
                locationManager.requestLocation()
            } else {
                locationManager.startUpdatingLocation()
            }
        } else {
            locationManager.requestWhenInUseAuthorization()
        }
    }
    
    open func reverseGeocodeLocation(_ location:CLLocation,handler:@escaping CLGeocodeCompletionHandler)
    {
        geocoder.cancelGeocode()
        
        let currentLanguages = UserDefaults.standard.object(forKey: "AppleLanguages")
        if forceReverseLanuage {
            UserDefaults.standard.set([reverseLanguageDesignator], forKey: "AppleLanguages")
        }
        
        geocoder.reverseGeocodeLocation(location) { marks, error in
            if self.forceReverseLanuage {
                UserDefaults.standard.set(currentLanguages, forKey: "AppleLanguages")
            }
            
            handler(marks, error)
        }
    }
    
    
    open func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        self.locateHandler?(locations)
        
        //find location
        if let first = locations.first
        {
            self.location = first
            self.easyLocateHandler?(first)
            self.locationManager.stopUpdatingLocation()
            
            if reverseHandler != nil || easyReverseHandler != nil
            {
                manager.stopUpdatingLocation()
                
                self.reverseGeocodeLocation(locations.first!, handler: { (marks, error) in
                    if let place = marks?.first
                    {
                        self.placemark = place
                        self.easyReverseHandler?(place)
                    }
                    
                    self.reverseHandler?(marks)
                })
            }
        }
    }
    
    open func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .notDetermined:
            break;
        case .restricted:
            break;
        case .denied:
            self.reverseHandler?(nil)
        case .authorizedAlways:
            break;
        case .authorizedWhenInUse:
            locationManager.startUpdatingLocation()
            break;
        }
    }
    
    open func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
    }
}
