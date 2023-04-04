//
//  PersistenceController.swift
//  Spirited Notes
//
//  Created by Jacob Brooks on 3/22/23.
//

import Foundation
import CoreData

var testTastings = [Tasting]()
var testDrinks = [Drink]()

struct PersistenceController {
    // A singleton for our entire app to use
    static let shared = PersistenceController()

    // Storage for Core Data
    let container: NSPersistentContainer

    // A test configuration for SwiftUI previews
    static var preview: PersistenceController = {
        let controller = PersistenceController(inMemory: true)

        // Create 5 drinks and tastings
        for i in 0..<5 {
            let drink = Drink(context: controller.container.viewContext)
            drink.id = UUID()
            drink.name = "Drink \(i)"
            drink.type = Drink.DrinkType.wine
            drink.imageName = "white-wine"
            
            let tasting = Tasting(context: controller.container.viewContext)
            tasting.id = UUID()
            tasting.rating = Int32(i)
            tasting.drink = drink
            tasting.notes = "great notes \(i)"
            controller.save()
        }

        return controller
    }()

    // An initializer to load Core Data, optionally able
    // to use an in-memory store.
    init(inMemory: Bool = false) {
        // If you didn't name your model Main you'll need
        // to change this name below.
        container = NSPersistentContainer(name: "Model")

        if inMemory {
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }

        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func save() {
        let context = container.viewContext

        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Show some error here
            }
        }
    }
}
