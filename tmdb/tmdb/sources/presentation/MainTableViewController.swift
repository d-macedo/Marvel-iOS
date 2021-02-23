//
//  ViewController.swift
//  tmdb
//
//  Created by Daniel Lourenco Macedo on 03/02/20.
//  Copyright © 2020 Daniel Lourenco Macedo. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController, UISearchBarDelegate {

    let viewModel = MainViewModel()
    var characters: [MainHeroCell] = []
    var searchLabel: String = ""
    
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Hero Name Starts With..."
        searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
        definesPresentationContext = true
        viewModel.getCharacterCells(name: "", offset: 0)
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "customcell")
        bindElements()
    }

    func bindElements() {
        viewModel.characters.bind { result in
            if let result = result {
                self.characters.append(contentsOf: result)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        let characterName = searchBar.text?.replacingOccurrences(of: " ", with: "%20").lowercased()
        searchLabel = characterName!
        self.characters = []
        viewModel.getCharacterCells(name: searchLabel, offset: 0)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "customcell", for: indexPath) as? CustomTableViewCell else {return UITableViewCell()}
        
        
        cell.name = characters[indexPath.item].name
        cell.portraitUrl = characters[indexPath.item].imagePath
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let item = characters.count - 50
        
        if indexPath.item == item {
            loadMoreData()
        }
    }
    
    private func loadMoreData() {
        viewModel.getCharacterCells(name: searchLabel, offset: characters.count - 1)
    }
}
