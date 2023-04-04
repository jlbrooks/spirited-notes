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
                NewDrink(onCancel: onCancelNewDrink, onSave: onSaveNewWine)
                    .transition(.slide)
            }
            Spacer()
        }.background(Color(UIColor.secondarySystemBackground))
    }
    
    // MARK: - Functions
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
    
    func onSaveNewWine(name: String,
                        varietal: String,
                        producer: String,
                        region: String,
                        vintage: Int32,
                        abv: Double) -> Void {
        let drink = Drink.newWine(
            context: PersistenceController.shared.container.viewContext,
            name: name,
            varietal: varietal,
            producer: producer,
            region: region,
            vintage: vintage,
            abv: abv,
            imageName: ""
        )
        PersistenceController.shared.save()
        selectedDrink = drink
        withAnimation {
            viewState = ViewState.newTasting
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
