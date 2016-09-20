//
//  ZXLocationManager.swift
//  demo
//
//  Created by zhangxi on 6/23/16.
//  Copyright © 2016 zhangxi. All rights reserved.
//

import Foundation
import CoreLocation

public typealias LocationHandler = (CLLocationManager,CLLocation?) -> Void
public typealias FindCityHandler = (String?) -> Void

public class ZXLocationManager : NSObject,CLLocationManagerDelegate
{
    public static let sharedManager = ZXLocationManager()
    
    let locationManager = CLLocationManager()
    let geocoder     = CLGeocoder()
    var handler:LocationHandler?
    var findCityHandler:FindCityHandler?
    
    override init() {
        super.init()
        locationManager.delegate = self
    }

    public func findCity(handler:(String?) -> Void)
    {
        self.findCityHandler = handler
        
        self.locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers
    }
    
    
    public func locate(desiredAccuracy:CLLocationAccuracy = kCLLocationAccuracyBest, handler:LocationHandler? = nil)
    {
        self.locationManager.requestWhenInUseAuthorization()
        self.handler = handler
        
        locationManager.desiredAccuracy = desiredAccuracy
    }
    public func reverseGeocodeLocation(location:CLLocation,handler:CLGeocodeCompletionHandler)
    {
        geocoder.cancelGeocode()
        geocoder.reverseGeocodeLocation(location, completionHandler: handler)
    }
    
    
    public func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.handler?(manager,locations.first)
        

        if findCityHandler != nil && locations.first != nil
        {
            manager.stopUpdatingLocation()
            
            self.reverseGeocodeLocation(locations.first!, handler: { (marks, error) in
                
                if let mark = marks?.first
                {
                    print(mark.locality)
                    self.findCityHandler?(mark.locality)
                }
            })
        }
        
    }
    
    public func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        switch status {
    
        case .NotDetermined:
            break;
        case .Restricted:
            break;
        case .Denied:
            self.findCityHandler?(nil)
        case .AuthorizedAlways:
            break;
        case .AuthorizedWhenInUse:
            locationManager.startUpdatingLocation()
            break;
        }
    }
    

    
}
