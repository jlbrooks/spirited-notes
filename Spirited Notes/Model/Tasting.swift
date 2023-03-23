//
//  Tasting.swift
//  Spirited Notes
//
//  Created by Jacob Brooks on 3/20/23.
//

import Foundation
import CoreLocation

struct Tasting : Hashable, Codable, Identifiable {
    var id: Int
    var drink: Drink
    var rating: Int
    var notes: String
    
    private var coordinates: Coordinates

    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude
        )
    }

    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
}
