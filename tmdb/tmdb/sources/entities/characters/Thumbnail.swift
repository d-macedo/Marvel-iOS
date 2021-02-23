//
//  Thumbnail.swift
//  tmdb
//
//  Created by Daniel Lourenco Macedo on 05/02/20.
//  Copyright © 2020 Daniel Lourenco Macedo. All rights reserved.
//

import Foundation
class Thumbnail: Codable {
    let path: String
    let `extension`: String
    
    enum CodingKeys: String, CodingKey {
        case path
        case `extension`
    }
    
    init(path: String, `extension`: String) {
        self.path = path
        self.`extension` = `extension`
    }
}
