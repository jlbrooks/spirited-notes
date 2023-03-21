//
//  ContentView.swift
//  Spirited Notes
//
//  Created by Jacob Brooks on 3/19/23.
//

import SwiftUI

func newTasting() -> Void {
    print("new")
}

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("Hello, world!")
            }
            .padding()
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
