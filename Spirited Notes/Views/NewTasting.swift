//
//  NewTasting.swift
//  Spirited Notes
//
//  Created by Jacob Brooks on 3/24/23.
//

import SwiftUI

struct NewTasting: View {
    // MARK: - Properties
    var drink: Drink
    var onChangeDrink: () -> Void
    @Environment(\.presentationMode) var presentationMode

    // MARK: - View
    var body: some View {
        VStack {
            Text("New tasting for \(drink.name!)")
            Button(action: onChangeDrink) {
                Text("Go back")
            }
        }
    }
    
    // MARK: - Functions
}

struct NewTasting_Previews: PreviewProvider {
    static let context = PersistenceController.preview.container.viewContext

    static var previews: some View {
        VStack {
            Text("foo")
        }
        .sheet(isPresented: .constant(true)) {
            NewTasting(
                drink: Drink.preview(context: context)) {  }
        }
        .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
