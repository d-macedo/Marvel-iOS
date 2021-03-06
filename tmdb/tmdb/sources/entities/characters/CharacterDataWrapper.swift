//
//  CharacterDataWrapper.swift
//  tmdb
//
//  Created by Daniel Lourenco Macedo on 05/02/20.
//  Copyright © 2020 Daniel Lourenco Macedo. All rights reserved.
//

import Foundation
class CharacterDataWrapper: Codable {
    let code: Int
    let status, copyright, attributionText, attributionHTML: String
    let etag: String
    let data: CharacterDataContainer
    
    init(code: Int, status: String, copyright: String, attributionText: String, attributionHTML: String, etag: String, data: CharacterDataContainer) {
        self.code = code
        self.status = status
        self.copyright = copyright
        self.attributionText = attributionText
        self.attributionHTML = attributionHTML
        self.etag = etag
        self.data = data
    }
}
