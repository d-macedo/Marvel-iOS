//
//  CharacterList.swift
//  tmdb
//
//  Created by Daniel Lourenco Macedo on 27/02/20.
//  Copyright © 2020 Daniel Lourenco Macedo. All rights reserved.
//

import Foundation
class CharacterList: Codable {
    let available: Int
    let collectionURI: String
    let items: [CharacterSummary]
    let returned: Int
    
    init(available: Int, collectionURI: String, items: [CharacterSummary], returned: Int) {
        self.available = available
        self.collectionURI = collectionURI
        self.items = items
        self.returned = returned
    }
}
