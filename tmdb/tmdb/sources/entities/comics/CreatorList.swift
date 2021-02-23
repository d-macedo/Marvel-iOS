//
//  CreatorList.swift
//  tmdb
//
//  Created by Daniel Lourenco Macedo on 27/02/20.
//  Copyright © 2020 Daniel Lourenco Macedo. All rights reserved.
//

import Foundation
class CreatorList: Codable {
    let available: Int
    let collectionURI: String
    let items: [CreatorSummary]
    let returned: Int
    
    init(available: Int, collectionURI: String, items: [CreatorSummary], returned: Int) {
        self.available = available
        self.collectionURI = collectionURI
        self.items = items
        self.returned = returned
    }
}
