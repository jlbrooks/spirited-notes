//
//  Drink+CoreDataClass.swift
//  Spirited Notes
//
//  Created by Jacob Brooks on 3/23/23.
//
//

import SwiftUI
import Foundation
import CoreData

@objc(Drink)
public class Drink: NSManagedObject {
    var image: Image {
        if let unwrappedImageName = imageName {
            return Image(unwrappedImageName)
        } else {
            return Image("unknown")
        }
    }
}
