//
//  Drink.swift
//  Spirited Notes
//
//  Created by Jacob Brooks on 3/20/23.
//

import Foundation
import SwiftUI

struct Drink : Hashable, Codable {
    var id: Int
    var name: String
    var type: String
    
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
}
