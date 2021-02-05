//
//  Coordinator.swift
//  NearMeApp-SwiftUI
//
//  Created by Page Kallop on 2/5/21.
//

import Foundation
import MapKit

final class Coordinator: NSObject, MKMapViewDelegate {
    
    var control: MapViewModel
    
    init(_ control: MapViewModel) {
        self.control = control  
    }

}
