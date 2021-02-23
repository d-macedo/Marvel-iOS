//
//  Url.swift
//  tmdb
//
//  Created by Daniel Lourenco Macedo on 05/02/20.
//  Copyright © 2020 Daniel Lourenco Macedo. All rights reserved.
//

import Foundation
class Url: Codable {
    let type: String
    let url: String
    
    init(type: String, url: String) {
        self.type = type
        self.url = url
    }
}
