//
//  CharacterDataContainer.swift
//  tmdb
//
//  Created by Daniel Lourenco Macedo on 05/02/20.
//  Copyright © 2020 Daniel Lourenco Macedo. All rights reserved.
//
import Foundation
class CharacterDataContainer: Codable {
    let offset, limit, total, count: Int
    let results: [Character]
    
    init(offset: Int, limit: Int, total: Int, count: Int, results: [Character]) {
        self.offset = offset
        self.limit = limit
        self.total = total
        self.count = count
        self.results = results
    }
}
