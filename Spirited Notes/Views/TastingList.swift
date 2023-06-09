//
//  TastingList.swift
//  Spirited Notes
//
//  Created by Jacob Brooks on 3/20/23.
//

import SwiftUI

struct TastingList: View {
    // MARK: - Properties
    @State private var addTastingSheetActive = false
    @FetchRequest(sortDescriptors: []) private var tastings: FetchedResults<Tasting>
    
    // MARK: - View
    var body: some View {
        NavigationView {
            List(tastings) { tasting in
                NavigationLink {
                    TastingDetail(tasting: tasting)
                } label: {
                    TastingRow(tasting: tasting)
                }
            }
            .navigationTitle("Tastings")
            .toolbar{
                ToolbarItemGroup(placement: .bottomBar) {
                    Spacer()
                    Button(action: newTasting) {
                        Image(systemName: "plus")
                            .imageScale(.large)
                            .font(.title)
                    }
                }
            }
        }
        .sheet(isPresented: $addTastingSheetActive) {
            NewTastingScreen()
        }
    }

    func newTasting() -> Void {
        addTastingSheetActive = true
    }
}

struct TastingList_Previews: PreviewProvider {
    static var previews: some View {
        TastingList()
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
