//
//  NewTastingScreen.swift
//  Spirited Notes
//
//  Created by Jacob Brooks on 3/28/23.
//

import SwiftUI

struct NewTastingScreen: View {
    // MARK: - Structures
    enum ViewState {
        case searchDrink, newDrink, newTasting
    }

    // MARK: - Properties
    @State private var searchText: String = ""
    @State private var viewState: ViewState = ViewState.searchDrink
    @State private var selectedDrink: Drink? = Optional.none
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
                }
                .disabled(true)
                .padding()
            }
            switch (viewState){
            case ViewState.searchDrink:
                DrinkSearch(onSelected: onDrinkSelected, onNewDrink: onNewDrink)
                    .transition(.slide)
            case ViewState.newTasting:
                NewTasting(drink: selectedDrink!, onChangeDrink: onChangeDrink)
                    .transition(.slide)
            case ViewState.newDrink:
                NewDrink(onCancel: onCancelNewDrink)
                    .transition(.slide)
            }
            Spacer()
        }.background(Color(UIColor.secondarySystemBackground))
    }
    
    // MARK: - Functions
    var searchResults: [Drink] {
        if searchText.isEmpty {
            return Array(drinks)
        } else {
            return drinks.filter { $0.name!.contains(searchText) }
        }
    }
    
    func onDrinkSelected(drink: Drink) -> Void {
        selectedDrink = Optional.some(drink)
        withAnimation {
            viewState = ViewState.newTasting
        }
    }
    
    func onChangeDrink() -> Void {
        withAnimation {
            viewState = ViewState.searchDrink
        }
        selectedDrink = Optional.none
    }
    
    func onNewDrink() -> Void {
        withAnimation {
            viewState = ViewState.newDrink
        }
    }
    
    func onCancelNewDrink() -> Void {
        withAnimation {
            viewState = ViewState.searchDrink
        }
    }

    func onCancel() -> Void {
        presentationMode.wrappedValue.dismiss()
    }
    
    func onSave() -> Void {
        presentationMode.wrappedValue.dismiss()
    }
}

struct NewTastingScreen_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Text("foo")
        }
        .sheet(isPresented: .constant(true)) {
            NewTastingScreen()
        }
        .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
