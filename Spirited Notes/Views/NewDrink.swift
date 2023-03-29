//
//  NewDrink.swift
//  Spirited Notes
//
//  Created by Jacob Brooks on 3/28/23.
//

import SwiftUI

struct NewDrink: View {
    // MARK: - Properties
    var onCancel: () -> Void
    @Environment(\.presentationMode) var presentationMode

    // MARK: - View
    var body: some View {
        VStack {
            Text("New drink")
            Button(action: onCancel) {
                Text("Go back")
            }
        }
    }
    
    // MARK: - Functions
}

struct NewDrink_Previews: PreviewProvider {
    static let context = PersistenceController.preview.container.viewContext

    static var previews: some View {
        VStack {
            Text("foo")
        }
        .sheet(isPresented: .constant(true)) {
            NewDrink(onCancel: { })
        }
        .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
