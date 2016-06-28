//
//  ZXLocationManager.swift
//  demo
//
//  Created by zhangxi on 6/23/16.
//  Copyright © 2016 zhangxi. All rights reserved.
//

import Foundation
import CoreLocation

public typealias LocationHandler = (manager:CLLocationManager,location:CLLocation?) -> Void


public class ZXLocationManager : NSObject,CLLocationManagerDelegate
{
    public static let sharedManager = ZXLocationManager()
    
    let locationManager = CLLocationManager()
    let geocoder     = CLGeocoder()
    var handler:LocationHandler?
    
    override init() {
        super.init()
        locationManager.delegate = self
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
        self.handler?(manager: manager,location:locations.first)
    }
    
    public func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        switch status {
    
        case .NotDetermined:
            break;
        case .Restricted:
            break;
        case .Denied:
            break;
        case .AuthorizedAlways:
            break;
        case .AuthorizedWhenInUse:
            locationManager.startUpdatingLocation()
            break;
        }
    }
    

    
}