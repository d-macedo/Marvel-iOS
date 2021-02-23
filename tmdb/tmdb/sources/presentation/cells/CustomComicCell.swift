//
//  CustomComicCell.swift
//  tmdb
//
//  Created by Daniel Lourenco Macedo on 11/02/20.
//  Copyright © 2020 Daniel Lourenco Macedo. All rights reserved.
//

import UIKit

class CustomComicCell: UICollectionViewCell {
    
    @IBOutlet var name: UILabel?
    @IBOutlet var comicCover: UIImageView?
    
    var comicName = "" {
        didSet {
            name?.text = comicName
        }
    }
    
    var comicPortrait = "" {
        didSet {
            setupPortrait(url: comicPortrait)
        }
    }
    
    var task: URLSessionDataTask = URLSessionDataTask()
    
    func setupPortrait(url: String) {
        task = URLSession.shared.dataTask(with: URL(string: url)!) { (data, response, error) in
            if let data = data {
                do {
                    DispatchQueue.main.async {
                        self.comicCover?.image = UIImage(data: data)
                    }
                } catch let error {
                    print(error)
                }
            }
        }
        task.resume()
    }
    
    override func prepareForReuse() {
        self.comicCover?.image = nil
        self.name?.text = ""
        task.cancel()
    }

}
