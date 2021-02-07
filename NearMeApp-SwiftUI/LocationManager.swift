//
//  LocationManager.swift
//  NearMeApp-SwiftUI
//
//  Created by Page Kallop on 2/5/21.
//

import Foundation
import MapKit

class LocationManager: NSObject {
    
    private let locationManager = CLLocationManager()
    var location: CLLocation? = nil
    
    override init(){
        super.init()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.distanceFilter = kCLDistanceFilterNone
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.stopUpdatingLocation()
    }
}


extension LocationManager: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {
         return
    }
        self.location = location
    }
}
