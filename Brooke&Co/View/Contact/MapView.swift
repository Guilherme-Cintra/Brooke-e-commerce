//
//  MapView.swift
//  Brooke&Co
//
//  Created by Guilherme Cintra Castro on 2023-11-05.
//

import SwiftUI
import MapKit

struct AnnotatedItem: Identifiable {
    let id = UUID()
    var coordinate: CLLocationCoordinate2D
}

struct MapView: View {
    var location : String = "81 Rue Saint-Viateur Est, Montréal, QC H2T 1A7 Canada"
    
    @State private var region: MKCoordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 45.52694, longitude: -73.598237), span: MKCoordinateSpan(latitudeDelta: 1.0, longitudeDelta: 1.0))

    @State var annotatedItem: AnnotatedItem = AnnotatedItem(coordinate: CLLocationCoordinate2D(latitude: 45.52694, longitude: -73.598237))
    
    var body: some View {
        
        VStack {
            Map(coordinateRegion: $region, annotationItems: [annotatedItem]) {
                item in
                MapMarker(coordinate: item.coordinate, tint: .red)
            }
                .task {
                    convertAddress(location: location)
            }
            Text("\(location)")
                .foregroundColor(customBlueLighter)
                .multilineTextAlignment(.center)
                .padding()
                
        }
        
        
    } 
    
    private func convertAddress(location: String) {
        
        let geoCoder = CLGeocoder()
        
        geoCoder.geocodeAddressString(location, completionHandler: {placemarks, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
             
            guard let placemarks = placemarks,
                  let location = placemarks[0].location else {
                return
            }
            
            self.region = MKCoordinateRegion(center: location.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.0015, longitudeDelta: 0.0015))
            self.annotatedItem = AnnotatedItem(coordinate: location.coordinate)
        })
    }
}


struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(location: "81 Rue Saint-Viateur Est, Montréal, QC H2T 1A7 Canada")
    }
}
