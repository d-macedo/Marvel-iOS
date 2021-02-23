//
//  ComicManager.swift
//  tmdb
//
//  Created by Daniel Lourenco Macedo on 27/02/20.
//  Copyright © 2020 Daniel Lourenco Macedo. All rights reserved.
//

import Foundation
class ComicManager: Manager {
    let provider: ComicProvider
    let business: ComicBusiness
    
    init(provider: ComicProvider, business: ComicBusiness) {
        self.provider = provider
        self.business = business
    }
    
    func getComicsData(name: String, offset: Int, completion: @escaping ([MainComicCell])->()) {
        let operation = ComicsDataOperation(comicName: name, offset: offset, provider: provider, business: business) { result in
            completion(result)
        }
        addOperation(operation)
    }
    
    func getComicDetail(comicId: Int, completion: @escaping (Comic)->()) {
        let operation = ComicDetailDataOperation(provider: provider, business: business, comicId: comicId) { result in
            completion(result)
        }
        addOperation(operation)
    }
}

class ComicDetailDataOperation: AsyncOperation {
    let provider: ComicProvider
    let business: ComicBusiness
    let comicId: Int
    let completion: (Comic)->()
    
    init(provider: ComicProvider, business: ComicBusiness, comicId: Int, completion: @escaping (Comic)->()) {
        self.provider = provider
        self.business = business
        self.comicId = comicId
        self.completion = completion
    }
    
    override func main() {
        provider.getComicDetails(comicId: comicId) { comic in
            self.completion(comic)
        }
    }
}


class ComicsDataOperation: AsyncOperation {
    
    let provider: ComicProvider
    let business: ComicBusiness
    let comicName: String
    let offset: Int
    let completion: ([MainComicCell])->()
    
    init(comicName: String, offset:Int, provider: ComicProvider, business: ComicBusiness, completion: @escaping ([MainComicCell])->()) {
        self.provider = provider
        self.business = business
        self.completion = completion
        self.comicName = comicName
        self.offset = offset
    }
    
    override func main() {
        provider.getComics(comicName: comicName, offset: offset) { comics in
            var cells: [MainComicCell] = []
            
            for comic in comics {
                cells.append(self.business.convertToMainComicCell(comic: comic))
            }
            
            self.completion(cells)
        }
    }
}
