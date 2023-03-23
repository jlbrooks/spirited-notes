//
//  TastingRow.swift
//  Spirited Notes
//
//  Created by Jacob Brooks on 3/20/23.
//

import SwiftUI

struct TastingRow: View {
    var tasting: Tasting

    var body: some View {
        HStack {
            tasting.drink?.image
                .resizable()
                .frame(width: 100, height: 100)
            VStack(alignment: .leading) {
                HStack() {
                    Text((tasting.drink?.name) ?? "unknown name")
                    Text((tasting.drink?.type) ?? "unknown type").fontWeight(Font.Weight.ultraLight)
                    Spacer()
                }
                HStack {
                    Text(String(tasting.rating) + " stars")
                    Spacer()
                }
            }
            .padding(10.0)
        }
        .clipShape(RoundedRectangle(cornerRadius: 24))
        .shadow(radius: 8)
    }
}

struct TastingRow_Previews: PreviewProvider {
    @FetchRequest(sortDescriptors: []) static private var tastings: FetchedResults<Tasting>
    static var previews: some View {
        TastingRow(tasting: tastings[0])
            .padding(20.0)
            .previewLayout(.fixed(width: 300, height: 70))
    }
}
