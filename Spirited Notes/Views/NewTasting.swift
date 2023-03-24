//
//  NewTasting.swift
//  Spirited Notes
//
//  Created by Jacob Brooks on 3/22/23.
//

import SwiftUI

struct NewTasting: View {
    // MARK: - Properties
    @State private var searchText: String = ""
    @Environment(\.presentationMode) var presentationMode
    @FetchRequest(sortDescriptors: []) private var drinks: FetchedResults<Drink>
    
    // MARK: - View
    var body: some View {
        VStack{
            HStack{
                Button(action: onCancel) {
                    Text("Cancel")
                        .foregroundColor(Color.red)
                }
                .padding()
                Spacer()
                Button(action: onSave) {
                    Text("Save")
                        .foregroundColor(Color.red)
                }
                .disabled(true)
                .padding()
            }
            NavigationStack {
                List(searchResults) { drink in
                    Text(drink.name!)
                }
            }
            .searchable(
                text: $searchText,
                prompt: "Drink"
            )
        }
    }
    
    // MARK: - Functions
    var searchResults: [Drink] {
        if searchText.isEmpty {
            return Array(drinks)
        } else {
            return drinks.filter { $0.name!.contains(searchText) }
        }
    }

    func onCancel() -> Void {
        presentationMode.wrappedValue.dismiss()
    }
    
    func onSave() -> Void {
        presentationMode.wrappedValue.dismiss()
    }
}

struct NewTasting_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Text("foo")
        }
        .sheet(isPresented: .constant(true)) {
            NewTasting()
        }
        .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
