//
//  ComicsCollectionViewController.swift
//  tmdb
//
//  Created by Daniel Lourenco Macedo on 11/02/20.
//  Copyright © 2020 Daniel Lourenco Macedo. All rights reserved.
//

import UIKit
class ComicsCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
    
    let viewModel = ComicViewModel()
    var comics: [MainComicCell] = []
    var filteredComics: [MainComicCell] = []
    var searchLabel: String = ""
    
    let searchController = UISearchController(searchResultsController: nil)

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        configureSearchBar()
        viewModel.getComicsCells(name: searchLabel, offset: 0)
        bindElements()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return comics.count
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ComicCell", for: indexPath) as? CustomComicCell else {
            return UICollectionViewCell()
        }
        cell.comicName = comics[indexPath.item].name
        cell.comicPortrait = comics[indexPath.item].imagePath
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let item = comics.count - 30

        if (indexPath.item == item) {
            loadMoreData()
        }
    }
    
    private func loadMoreData(){
        viewModel.getComicsCells(name: searchLabel, offset: comics.count - 1)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionView.elementKindSectionFooter {
            let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "ComicFooterCell", for: indexPath)
            return footerView
        } else {
            return UICollectionReusableView()
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = comics[indexPath.item]
        let viewController = storyboard?.instantiateViewController(withIdentifier: "ComicDetailViewController") as! ComicDetailViewController
        viewController.comicId = item.id
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let cellWidth = CGFloat((collectionView.frame.width - 16) / 3)
        let cellHeight = CGFloat(cellWidth * 1.5)
        
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout
        collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 4
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        let comicName = searchBar.text?.replacingOccurrences(of: " ", with: "%20").lowercased()
        searchLabel = comicName!
        self.comics = []
        viewModel.getComicsCells(name: searchLabel, offset: 0)
        self.resetCollectionView()
    }
    
    private func configureSearchBar() {
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Comic Name Starts With..."
        searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    private func bindElements() {
        viewModel.comics.bind { result in
            if let result = result {
                if (!result.elementsEqual(self.comics)) {
                    self.comics.append(contentsOf: result)
                    self.resetCollectionView()
                }
            }
        }
    }
    
    private func resetCollectionView() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}
