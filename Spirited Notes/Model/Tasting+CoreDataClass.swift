//
//  Tasting+CoreDataClass.swift
//  Spirited Notes
//
//  Created by Jacob Brooks on 3/23/23.
//
//

import Foundation
import CoreData
import CoreLocation

@objc(Tasting)
public class Tasting: NSManagedObject {
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: latitude,
            longitude: longitude
        )
    }
}
