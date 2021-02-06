//
//  ContentView.swift
//  NearMeApp-SwiftUI
//
//  Created by Page Kallop on 2/5/21.
//

import SwiftUI
import MapKit

struct ContentView: View {
    
    @ObservedObject private var locationManager = LocationManager()
    
    @State private var search: String = ""
    
    private func getNearByLandmarks() {
        
        guard let location = self.locationManager.location else {
            return
        }
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = self.search
        request.region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
        
        let search = MKLocalSearch(request: request)
        search.start { (responce, error) in
            guard let responce = responce, error == nil else {
                return
            }
            
            let mapItems = responce.mapItems
            mapItems.map {
                print($0.placemark)
            }
            
        }
    }
    
    var body: some View {
        
        ZStack(alignment: .top) {
        MapViewModel()
            TextField("Search", text: self.$search, onEditingChanged: {_ in }) {
                getNearByLandmarks()
            }.textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
            .offset(y: 44)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
