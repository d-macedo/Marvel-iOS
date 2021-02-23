//
//  MainViewModel.swift
//  tmdb
//
//  Created by Daniel Lourenco Macedo on 07/02/20.
//  Copyright © 2020 Daniel Lourenco Macedo. All rights reserved.
//

import Foundation
class MainViewModel {
    
    let manager = CharacterManager(provider: CharacterProvider(), business: CharacterBusiness())
    
    let characters = Bindable<[MainHeroCell]?>(nil)
    let searchFlag = Bindable<Bool?>(nil)
    
    func getCharacterCells(name: String, offset: Int) {
        return manager.getHeroesData(name: name, offset: offset) { cells in
            self.characters.value = cells
        }
    }
}
