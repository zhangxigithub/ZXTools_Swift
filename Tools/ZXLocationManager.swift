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
    static let sharedManager = ZXLocationManager()
    
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
        locationManager.startUpdatingLocation()
        
    }
    public func reverseGeocodeLocation(location:CLLocation,handler:CLGeocodeCompletionHandler)
    {
        geocoder.cancelGeocode()
        geocoder.reverseGeocodeLocation(location, completionHandler: handler)
    }
    
    /*
     CLGeocoder *theGeocoder = [[CLGeocoder alloc] init];
     [geo addObject:theGeocoder];
     CLLocation *location = [[CLLocation alloc] initWithLatitude:coordinate.latitude longitude:coordinate.longitude];
     
     [theGeocoder reverseGeocodeLocation:location
     completionHandler:^(NSArray *placemarks, NSError *error) {
     
     NSLog(@"获取到位置");
     if(error != nil){
     */
    
    public func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.handler?(manager: manager,location:locations.first)
    }
    
    
    
    
    
    /*
     CLLocationManager *locationManager;
     id geocoder;
     
     void(^locationInfo)(CLLocation *);
     void(^placeMark)(MKPlacemark *);
     
     NSMutableArray *geo;
     */
    
}