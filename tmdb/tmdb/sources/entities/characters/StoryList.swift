//
//  StoryList.swift
//  tmdb
//
//  Created by Daniel Lourenco Macedo on 05/02/20.
//  Copyright © 2020 Daniel Lourenco Macedo. All rights reserved.
//

import Foundation
class StoryList: Codable {
    let available: Int
    let collectionURI: String
    let items: [StorySummary]
    let returned: Int
    
    init(available: Int, collectionURI: String, items: [StorySummary], returned: Int) {
        self.available = available
        self.collectionURI = collectionURI
        self.items = items
        self.returned = returned
    }
}
