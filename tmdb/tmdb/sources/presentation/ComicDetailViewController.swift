//
//  ComicDetailViewController.swift
//  tmdb
//
//  Created by Daniel Lourenco Macedo on 02/03/20.
//  Copyright © 2020 Daniel Lourenco Macedo. All rights reserved.
//

import UIKit

class ComicDetailViewController: UIViewController {
    
    var comicId: Int = 0
    let comicDetailViewModel = ComicDetailViewModel()
    var isContentCollapsed: Bool = false
    
    @IBOutlet weak var backgroundHeight: NSLayoutConstraint!
    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var expandButton: UIButton!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if comicId != 0 {
            comicDetailViewModel.getComicsDetail(comicId: comicId)
        }
        bindElements()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureContentView()
    }
    
    @IBAction func clickExpandButton(_ sender: UIButton) {
        if isContentCollapsed {
            expandContentView()
        } else {
            collapseContentView()
        }
    }
    
    private func configureContentView() {
        backgroundView.backgroundColor = UIColor(white: 0, alpha: 0.6)
        isContentCollapsed = true
        backgroundHeight.constant = 0
    }
    
    private func bindElements() {
        comicDetailViewModel.comic.bind { result in
            if result != nil {
                self.configureDetailScreen(comic: result!)
            }
        }
    }
    
    private func expandContentView() {
        isContentCollapsed = false
        UIView.animate(withDuration: 1.0) {
            self.backgroundHeight.constant = self.coverImage.frame.height
            self.view.layoutIfNeeded()
        }
    }
    
    private func collapseContentView() {
        isContentCollapsed = true
        UIView.animate(withDuration: 1) {
            self.backgroundHeight.constant = 0
            self.view.layoutIfNeeded()
        }
    }
    
    private func configureDetailScreen(comic: Comic) {
        DispatchQueue.main.async {
            self.titleLabel?.text = comic.title
            self.descriptionLabel?.text = comic.description
            
            if comic.images.count > 0 {
                self.loadImage(url: comic.images[0].path, ext: comic.images[0].extension)
            }
        }
    }
    
    private func loadImage (url: String, ext: String) {
        let size = "portrait_uncanny"
        let securityUrl = url.replacingOccurrences(of: "http", with: "https")
        let imagePath = "\(securityUrl)/\(size).\(ext)"
        
        let task = URLSession.shared.dataTask(with: URL(string: imagePath)!) { (data, response, error) in
            if let data = data {
                do {
                    DispatchQueue.main.async {
                        self.coverImage?.image = UIImage(data: data)
                    }
                }
            }
        }
        task.resume()
    }
}
