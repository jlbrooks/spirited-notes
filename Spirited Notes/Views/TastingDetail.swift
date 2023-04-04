//
//  TastingDetail.swift
//  Spirited Notes
//
//  Created by Jacob Brooks on 3/20/23.
//

import SwiftUI

struct TastingDetail: View {
    var tasting: Tasting

    var body: some View {
        ScrollView {
            MapView(coordinate: tasting.locationCoordinate)
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)
            CircleImage(image: tasting.drink!.image)
                .offset(y: -130)
                .padding(.bottom, -130)
            VStack(alignment: .leading) {
                Text(tasting.drink?.name ?? "unknown name")
                    .font(.title)
                HStack {
                    Text(tasting.drink?.type.rawValue ?? "unknown type")
                    Spacer()
                    Text(String(tasting.rating))
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                Divider()
                Text("Notes for \(tasting.drink!.name!)")
                    .font(.title2)
                Spacer()
                Text(tasting.notes ?? "")
                    .font(.body)
            }
            .padding()
        }
        .navigationTitle(tasting.drink!.name!)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct TastingDetail_Previews: PreviewProvider {
    @FetchRequest(sortDescriptors: []) static private var tastings: FetchedResults<Tasting>
    static var previews: some View {
        TastingDetail(tasting: tastings[0])
    }
}
