//
//  ViewController.swift
//  Konefer
//
//  Created by Владислав on 19.02.2021.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionViewNames: UICollectionView!
    @IBOutlet weak var collectionViewStocks: UICollectionView!
    
    // MARK: - Private Properties
    var parsing = ParsingData()
    lazy var reloadcollectionViewStocks = { self.collectionViewStocks.reloadData() }
    
    // MARK: - Initializers
    override func viewDidLoad() {
        super.viewDidLoad()
        configcollectionViewNames()
        configCollectionViewStocks()
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationItem.largeTitleDisplayMode = .always
        
        let search = UISearchController(searchResultsController: nil)
        search.searchResultsUpdater = self
        self.navigationItem.searchController = search
        
        parsing.parsing(reloadTableView: reloadcollectionViewStocks)
        //collectionViewStocks.reloadData()
    }
    
    // MARK: - Private Methods
    private func configcollectionViewNames() {
        self.collectionViewNames.register(UINib(nibName: "MenuCollViewCell", bundle: nil), forCellWithReuseIdentifier: "MenuCollViewCell")
        self.collectionViewNames.dataSource = self
        self.collectionViewNames.delegate = self
    }
    
    private func configCollectionViewStocks() {
        self.collectionViewStocks.register(UINib(nibName: "StocksCollViewCell", bundle: nil), forCellWithReuseIdentifier: "StocksCollViewCell")
        self.collectionViewStocks.dataSource = self
        self.collectionViewStocks.delegate = self
    }
    
    // MARK: - Override Methods
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if scrollView == collectionViewStocks {
            let cells = collectionViewStocks.visibleCells
            if let cell = cells.first, let indexPath = self.collectionViewStocks.indexPath(for: cell) {
            //    self.selectedGroup = self.group.groups![indexPath.item]
                self.collectionViewNames.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
                self.collectionViewNames.reloadData()
            }
        }
    }
}

extension MainViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        parsing.searchParsing(input: searchController.searchBar.text ?? "", reloadTableView: self.reloadcollectionViewStocks)
    }
}


