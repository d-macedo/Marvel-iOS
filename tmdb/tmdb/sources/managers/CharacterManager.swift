//
//  CharacterManager.swift
//  tmdb
//
//  Created by Daniel Lourenco Macedo on 06/02/20.
//  Copyright © 2020 Daniel Lourenco Macedo. All rights reserved.
//

import Foundation
class CharacterManager: Manager {
    
    let provider: CharacterProvider
    let business: CharacterBusiness
    
    init(provider: CharacterProvider, business: CharacterBusiness) {
        self.provider = provider
        self.business = business
    }
    
    func getHeroesData(name: String, offset: Int, completion: @escaping ([MainHeroCell])->()) {
        let operation = HeroesDataOperation(characterName: name, offset: offset, provider: provider, business: business) { result in
            completion(result)
        }
        addOperation(operation)
    }
    
    
}

class HeroesDataOperation: AsyncOperation {
    
    let provider: CharacterProvider
    let business: CharacterBusiness
    let characterName: String
    let offset: Int
    let completion: ([MainHeroCell])->()
    
    init(characterName: String, offset: Int, provider: CharacterProvider, business: CharacterBusiness, completion: @escaping ([MainHeroCell])->()) {
        self.provider = provider
        self.business = business
        self.completion = completion
        self.characterName = characterName
        self.offset = offset
    }
    
    override func main() {
        provider.getCharacters(characterName: characterName, offset: offset) { chars in
            var cells: [MainHeroCell] = []
            
            for char in chars {
                cells.append(self.business.convertToMainHeroCell(char: char))
            }
            
            self.completion(cells)
        }
    }
}
