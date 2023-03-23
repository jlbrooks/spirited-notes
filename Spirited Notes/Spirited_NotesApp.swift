//
//  Spirited_NotesApp.swift
//  Spirited Notes
//
//  Created by Jacob Brooks on 3/19/23.
//

import SwiftUI

@main
struct Spirited_NotesApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            HomeView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
