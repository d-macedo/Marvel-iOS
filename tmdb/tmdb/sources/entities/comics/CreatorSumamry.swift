//
//  CreatorSumamry.swift
//  tmdb
//
//  Created by Daniel Lourenco Macedo on 27/02/20.
//  Copyright © 2020 Daniel Lourenco Macedo. All rights reserved.
//

import Foundation
class CreatorSummary: Codable {
    let resourceURI: String
    let name: String
    let role: String
    
    init(resourceURI: String, name: String, role: String) {
        self.resourceURI = resourceURI
        self.name = name
        self.role = role
    }
}
