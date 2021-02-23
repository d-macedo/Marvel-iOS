//
//  CustomComicFooterCell.swift
//  tmdb
//
//  Created by Daniel Lourenco Macedo on 28/02/20.
//  Copyright © 2020 Daniel Lourenco Macedo. All rights reserved.
//

import UIKit
class CustomComicFooterCell : UICollectionReusableView {
    
    @IBOutlet weak var loadingCell: UIActivityIndicatorView!
    
    override func awakeFromNib() {
        loadingCell.isHidden = false
        loadingCell.startAnimating()
    }
}
