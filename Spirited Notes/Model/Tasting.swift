//
//  Tasting.swift
//  Spirited Notes
//
//  Created by Jacob Brooks on 3/20/23.
//

import Foundation

struct Tasting : Hashable, Codable, Identifiable {
    var id: Int
    var drink: Drink
    var rating: Int
    var notes: String
}
