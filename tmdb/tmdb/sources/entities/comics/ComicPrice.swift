//
//  ComicPrice.swift
//  tmdb
//
//  Created by Daniel Lourenco Macedo on 27/02/20.
//  Copyright © 2020 Daniel Lourenco Macedo. All rights reserved.
//

import Foundation
class ComicPrice: Codable {
    let type: String
    let price: Double
    
    init(type: String, price: Double) {
        self.type = type
        self.price = price
    }
}
