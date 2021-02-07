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
    @State private var landmarks = [Landmark]()
    
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
           self.landmarks = mapItems.map {
              Landmark(placemark: $0.placemark)
            }
            
        }
    }
    
    func calculateOffset() -> CGFloat {
        if self.landmarks.count > 0 {
            
            return UIScreen.main.bounds.size.height - UIScreen.main.bounds.size.height / 4
        } else {
            return UIScreen.main.bounds.size.height
        }
    }
    
    var body: some View {
        
        ZStack(alignment: .top) {
            MapViewModel(landmarks: self.landmarks)
            TextField("Search", text: self.$search, onEditingChanged: { _ in }) {
                
                self.getNearByLandmarks()
            }.textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
            .offset(y: 44)
            
            PlaceListView(landmarks: self.landmarks)
                .offset(y: calculateOffset())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
