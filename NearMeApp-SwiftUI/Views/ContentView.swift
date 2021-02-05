//
//  ContentView.swift
//  NearMeApp-SwiftUI
//
//  Created by Page Kallop on 2/5/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var locationManager = LocationManager()
    
    var body: some View {
        MapViewModel()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
