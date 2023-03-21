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
            Text(tasting.drink.name)
        }
    }
}

struct TastingDetail_Previews: PreviewProvider {
    static var previews: some View {
        TastingDetail(tasting: tastings[0])
    }
}
