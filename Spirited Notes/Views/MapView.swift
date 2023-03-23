//
//  MapView.swift
//  Spirited Notes
//
//  Created by Jacob Brooks on 3/22/23.
//

import SwiftUI
import MapKit

struct IdentifiablePlace: Identifiable {
    let id: UUID
    let location: CLLocationCoordinate2D
    init(id: UUID = UUID(), coordinate: CLLocationCoordinate2D) {
        self.id = id
        self.location = coordinate
    }
}


struct MapView: View {
    var coordinate: CLLocationCoordinate2D
    @State private var region = MKCoordinateRegion()
    var body: some View {
        Map(coordinateRegion: $region,
            annotationItems: [IdentifiablePlace(coordinate: coordinate)])
        { place in
            MapMarker(coordinate: place.location,
                      tint: Color.purple)
        }
            .onAppear {
                setRegion(coordinate)
            }
        
    }


    private func setRegion(_ coordinate: CLLocationCoordinate2D) {
        region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
        )
    }
}


struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
    }
}
