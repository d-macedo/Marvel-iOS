//
//  ComicViewModel.swift
//  tmdb
//
//  Created by Daniel Lourenco Macedo on 27/02/20.
//  Copyright © 2020 Daniel Lourenco Macedo. All rights reserved.
//

import Foundation
class ComicViewModel {
    
    let manager = ComicManager(provider: ComicProvider(), business: ComicBusiness())
    
    let comics = Bindable<[MainComicCell]?>(nil)
    
    func getComicsCells(name: String, offset: Int) {
        return manager.getComicsData(name: name, offset: offset) { cells in
            self.comics.value = cells
        }
    }
}
