//
//  DrinkSearch.swift
//  Spirited Notes
//
//  Created by Jacob Brooks on 3/22/23.
//

import SwiftUI

struct DrinkSearch: View {
    // MARK: - Properties
    var onSelected: (Drink) -> Void
    var onNewDrink: () -> Void
    @State private var searchText: String = ""
    @FetchRequest(sortDescriptors: []) private var drinks: FetchedResults<Drink>

    // MARK: - View
    var body: some View {
        VStack{
                List() {
                    TextField("Drink name", text: $searchText)
                    Section {
                        ForEach(searchResults) { drink in
                            Button(action: { onSelected(drink) }) {
                                Text(drink.name!)
                            }
                        }
                    }
                    Section{
                        Button(action: onNewDrink) {
                            HStack {
                                Spacer()
                                Image(systemName: "plus")
                                    .font(.title)
                                Text("Add new drink...")
                                    .fontWeight(.bold)
                                    .foregroundColor(.black)
                                Spacer()
                            }
                        }
                    }
                }
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
}

struct NewTastingDrinkSearch_Previews: PreviewProvider {

    static var previews: some View {
        VStack {
            Text("foo")
        }
        .sheet(isPresented: .constant(true)) {
            DrinkSearch(onSelected: {(drink: Drink) -> Void in }, onNewDrink: {})
        }
        .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
