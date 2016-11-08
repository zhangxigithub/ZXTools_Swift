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

open class ZXLocationManager : NSObject,CLLocationManagerDelegate
{
    open static let sharedManager = ZXLocationManager()
    
    let locationManager = CLLocationManager()
    let geocoder     = CLGeocoder()
    var handler:LocationHandler?
    var findCityHandler:FindCityHandler?
    
    override init() {
        super.init()
        locationManager.delegate = self
    }

    open func findCity(_ handler:@escaping (String?) -> Void)
    {
        self.findCityHandler = handler
        
        switch CLLocationManager.authorizationStatus() {
        
        case .notDetermined,.restricted:
            self.locationManager.requestWhenInUseAuthorization()
        case .denied:
            self.findCityHandler?(nil)
        case .authorizedAlways,.authorizedWhenInUse:
            self.locationManager.startUpdatingLocation()
        }
        
        locationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers
    }
    
    
    open func locate(_ desiredAccuracy:CLLocationAccuracy = kCLLocationAccuracyBest, handler:LocationHandler? = nil)
    {
        self.locationManager.requestWhenInUseAuthorization()
        self.handler = handler
        
        locationManager.desiredAccuracy = desiredAccuracy
    }
    open func reverseGeocodeLocation(_ location:CLLocation,handler:@escaping CLGeocodeCompletionHandler)
    {
        geocoder.cancelGeocode()
        geocoder.reverseGeocodeLocation(location, completionHandler: handler)
    }
    
    
    open func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
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
    
    open func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
    
        case .notDetermined:
            break;
        case .restricted:
            break;
        case .denied:
            self.findCityHandler?(nil)
        case .authorizedAlways:
            break;
        case .authorizedWhenInUse:
            locationManager.startUpdatingLocation()
            break;
        }
    }
    

    
}
