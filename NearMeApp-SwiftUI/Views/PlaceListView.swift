//
//  PlaceListView.swift
//  NearMeApp-SwiftUI
//
//  Created by Page Kallop on 2/7/21.
//

import SwiftUI
import MapKit

struct PlaceListView: View {
    
    let landmarks: [Landmark]
    var body: some View {
        
        VStack{
            HStack{
                EmptyView()
                
            }.frame(width: UIScreen.main.bounds.size.width, height: 60)
            .background(Color.blue)
            
            
        List(self.landmarks, id: \.id) { landmark in
            Text(landmark.name)
         }
       }
        
    }
}

struct PlaceListView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceListView(landmarks: [Landmark(placemark: MKPlacemark())])
    }
}
