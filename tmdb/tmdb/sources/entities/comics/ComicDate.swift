//
//  ComicDate.swift
//  tmdb
//
//  Created by Daniel Lourenco Macedo on 27/02/20.
//  Copyright © 2020 Daniel Lourenco Macedo. All rights reserved.
//

import Foundation
class ComicDate: Codable {
    let type: String
    let date: String
    
    init(type: String, date: String) {
        self.type = type
        self.date = date
    }
}
