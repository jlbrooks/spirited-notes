//
//  HomeView.swift
//  Spirited Notes
//
//  Created by Jacob Brooks on 3/19/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        TastingList()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
