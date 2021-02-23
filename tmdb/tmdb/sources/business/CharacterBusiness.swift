//
//  CharacterBusiness.swift
//  tmdb
//
//  Created by Daniel Lourenco Macedo on 06/02/20.
//  Copyright © 2020 Daniel Lourenco Macedo. All rights reserved.
//

import UIKit
class CharacterBusiness {
    
    func convertToMainHeroCell(char: Character) -> MainHeroCell {
        let url = char.thumbnail.path
        let ext = char.thumbnail.extension
        let size = "portrait_small"

        let securityUrl = url.replacingOccurrences(of: "http", with: "https")
        let imagePath = "\(securityUrl)/\(size).\(ext)"
        
        return MainHeroCell(name: char.name, imagePath: imagePath)
    }
}
