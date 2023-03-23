//
//  TastingList.swift
//  Spirited Notes
//
//  Created by Jacob Brooks on 3/20/23.
//

import SwiftUI

func newTasting() -> Void {
    print("new")
}

struct TastingList: View {
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
    }
}

struct TastingList_Previews: PreviewProvider {
    static var previews: some View {
        TastingList()
    }
}
