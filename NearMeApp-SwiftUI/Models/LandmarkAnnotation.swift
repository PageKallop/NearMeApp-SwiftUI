//
//  LandmarkAnnotation.swift
//  NearMeApp-SwiftUI
//
//  Created by Page Kallop on 2/6/21.
//

import Foundation
import MapKit

final class LandmarkAnnotation: NSObject, MKAnnotation {
    
    let title: String?
    let coordinate: CLLocationCoordinate2D
    
    init(landmark: Landmark) {
        self.title = landmark.name
        self.coordinate = landmark.coordinate
    }
}
