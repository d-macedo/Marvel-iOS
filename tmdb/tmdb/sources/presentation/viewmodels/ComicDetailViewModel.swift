//
//  ComicDetailViewModel.swift
//  tmdb
//
//  Created by Daniel Lourenco Macedo on 02/03/20.
//  Copyright © 2020 Daniel Lourenco Macedo. All rights reserved.
//

import UIKit
class ComicDetailViewModel {
    
    let manager = ComicManager(provider: ComicProvider(), business: ComicBusiness())
    
    let comic = Bindable<Comic?>(nil)
    
    func getComicsDetail(comicId: Int) {
        return manager.getComicDetail(comicId: comicId) { comic in
            self.comic.value = comic
        }
    }
}
