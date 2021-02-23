//
//  ComicDataContainer.swift
//  tmdb
//
//  Created by Daniel Lourenco Macedo on 27/02/20.
//  Copyright © 2020 Daniel Lourenco Macedo. All rights reserved.
//

import Foundation
class ComicDataContainer: Codable {
    let offset, limit, total, count: Int
    let results: [Comic]
    
    init(offset: Int, limit: Int, total: Int, count: Int, results: [Comic]) {
        self.offset = offset
        self.limit = limit
        self.total = total
        self.count = count
        self.results = results
    }
}
