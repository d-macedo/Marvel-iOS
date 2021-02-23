//
//  ComicBusiness.swift
//  tmdb
//
//  Created by Daniel Lourenco Macedo on 27/02/20.
//  Copyright © 2020 Daniel Lourenco Macedo. All rights reserved.
//

import Foundation
class ComicBusiness {
    
    func convertToMainComicCell(comic: Comic) -> MainComicCell {
        let url = comic.thumbnail.path
        let ext = comic.thumbnail.extension
        let size = "portrait_uncanny"
        
        let securityUrl = url.replacingOccurrences(of: "http", with: "https")
        let imagePath = "\(securityUrl)/\(size).\(ext)"
        
        return MainComicCell(name: comic.title, imagePath: imagePath, id: comic.id)
    }
}
