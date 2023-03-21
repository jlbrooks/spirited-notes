//
//  TastingList.swift
//  Spirited Notes
//
//  Created by Jacob Brooks on 3/20/23.
//

import SwiftUI

struct TastingList: View {
    var body: some View {
        List(tastings) { tasting in
            TastingRow(tasting: tasting)
        }
    }
}

struct TastingList_Previews: PreviewProvider {
    static var previews: some View {
        TastingList()
    }
}
