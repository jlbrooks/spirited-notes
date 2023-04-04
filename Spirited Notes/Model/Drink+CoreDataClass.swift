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
    // MARK: Structures
    enum DrinkType : String, CaseIterable, Identifiable {
        case wine = "Wine"
        case beer = "Beer"
        case cocktail = "Cocktail"
        
        var id: Self { self }
    }
    
    // MARK: Dynamic properties
    var image: Image {
        if let unwrappedImageName = imageName {
            return Image(unwrappedImageName)
        } else {
            return Image("unknown")
        }
    }
    
    var type: DrinkType {
        get {
            return DrinkType(rawValue: self.typeString!)!
        }
        
        set {
            self.typeString = newValue.rawValue
        }
    }
    
    // MARK: Helper functions
    static func newWine(context: NSManagedObjectContext,
                    name: String,
                    varietal: String,
                    producer: String,
                    region: String,
                    vintage: Int32,
                    abv: Double,
                    imageName: String) -> Drink {
        let drink = Drink(context: context)
        drink.id = UUID()
        drink.name = name
        drink.typeString = DrinkType.wine.rawValue
        drink.wineVarietal = varietal
        drink.wineProducer = producer
        drink.wineRegion = region
        drink.wineVintage = vintage
        drink.abv = abv
        drink.imageName = imageName
        return drink
    }
    
    static func preview(context: NSManagedObjectContext) -> Drink {
        let drink = Drink(context: context)
        drink.id = UUID()
        drink.name = "test"
        drink.typeString = "wine"
        drink.imageName = "white-wine"
        return drink
    }
}
