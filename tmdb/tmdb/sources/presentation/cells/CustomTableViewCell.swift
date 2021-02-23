//
//  CustomCellTableViewCell.swift
//  tmdb
//
//  Created by Daniel Lourenco Macedo on 04/02/20.
//  Copyright © 2020 Daniel Lourenco Macedo. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var portrait: UIImageView?
    @IBOutlet weak var nameLabel: UILabel?
    
    var name = "" {
        didSet {
            nameLabel?.text = name
        }
    }
    
    var portraitUrl = "" {
        didSet {
            setupPortraitURL(portraitUrl)
        }
    }
    
    var task: URLSessionDataTask = URLSessionDataTask()
    
    func setupPortraitURL(_ url: String) {
            task = URLSession.shared.dataTask(with: URL(string: url)!) { (data, response, error) in
                if let data = data {
                    do {
                        DispatchQueue.main.async {
                            self.portrait?.image = UIImage(data: data)
                        }
                    } catch let error {
                        print(error)
                    }
                }
            }
            task.resume()
    }
    
    override func prepareForReuse() {
        self.portrait?.image = nil
        self.nameLabel?.text = ""
        task.cancel()
    }
}
