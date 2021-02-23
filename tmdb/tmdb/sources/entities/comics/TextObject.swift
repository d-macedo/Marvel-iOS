//
//  TextObject.swift
//  tmdb
//
//  Created by Daniel Lourenco Macedo on 27/02/20.
//  Copyright © 2020 Daniel Lourenco Macedo. All rights reserved.
//

import Foundation
class TextObject: Codable {
    let type: String
    let language: String
    let text: String
    
    init(type: String, language: String, text: String) {
        self.type = type
        self.language = language
        self.text = text
    }
}
