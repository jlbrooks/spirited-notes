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
    var onSave: (String, String, String, String, Int32, Double) -> Void
    @State private var drinkName: String = ""
    @State private var drinkType: Drink.DrinkType?
    @State private var wineVarietal: String = ""
    @State private var wineProducer: String = ""
    @State private var wineRegion: String = ""
    @State private var wineVintage: String = ""
    @State private var abv: Double = 10.0
    @Environment(\.presentationMode) var presentationMode
    
    // MARK: - View
    var body: some View {
        VStack {
            List {
                Section {
                    TextField("Drink name", text: $drinkName)
                }
                Section {
                    Picker("Drink type", selection: $drinkType) {
                        if drinkType == nil {
                            Text("").tag(String?(nil))
                        }
                        ForEach(Drink.DrinkType.allCases) { type in
                            Text(type.rawValue).tag(Optional(type))
                        }
                    }
                }
                Section(header: Text("Details")) {
                    TextField("Varietal", text: $wineVarietal)
                    TextField("Producer", text: $wineProducer)
                    TextField("Region", text: $wineRegion)
                    TextField("Vintage", text: $wineVintage)
                }
                Section(header: Text("ABV")) {
                    HStack {
                        Text(String(format: "%.1f", abv))
                        Slider(
                            value: $abv,
                            in: 0...25,
                            step: 0.1
                        )
                    }
                    
                }
                Section {
                    Button(action: { onSave(drinkName, wineVarietal, wineProducer, wineRegion, Int32(wineVintage)!, abv) }) {
                        Text("Save Drink")
                    }
                }
                Section {
                    Button(action: onCancel) {
                        Text("Go back")
                    }
                }
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
            NewDrink(onCancel: { }, onSave: onSaveWine)
        }
        .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
    
    static func onSaveWine(name: String,
                           varietal: String,
                           producer: String,
                           region: String,
                           vintage: Int32,
                           abv: Double) -> Void {
        print("Save")
    }
}
