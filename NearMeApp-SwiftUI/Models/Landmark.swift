//
//  Landmark.swift
//  NearMeApp-SwiftUI
//
//  Created by Page Kallop on 2/6/21.
//

import Foundation
import MapKit

struct Landmark {
    
    let placemark: MKPlacemark
    
    var id: UUID {
        return UUID()
    }
    
    var name: String {
        self.placemark.name ?? ""
    }
    
    var title: String {
        self.placemark.title ?? ""
    }
    
    var coordinate: CLLocationCoordinate2D {
        
        self.placemark.coordinate
    }
}
