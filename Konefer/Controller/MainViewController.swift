//
//  ViewController.swift
//  Konefer
//
//  Created by Владислав on 19.02.2021.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var collectionViewNames: UICollectionView!
    @IBOutlet weak var collectionViewStocks: UICollectionView!
    
    // MARK: - Private Properties
    private lazy var reloadcollectionViewStocks = { self.collectionViewStocks.reloadData() }
    
    // MARK: - Public Properties
    public var parsing = ParsingData()
    
    // MARK: - Initializers
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configSearchController()
        configcollectionViewNames()
        configCollectionViewStocks()
        
        parsing.parsing(reloadTableView: reloadcollectionViewStocks)
    }
    
    // MARK: - Private Methods
    private func configSearchController() {
        let search = UISearchController(searchResultsController: nil)
        search.searchResultsUpdater = self
        search.obscuresBackgroundDuringPresentation = false
        search.searchBar.placeholder = "Search name or ticker"
        self.navigationItem.searchController = search
    }
    
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
        let input = searchController.searchBar.text!.uppercased().filter { "ABCDEFGHIJKLMNOPQRSTUVWXYZ".contains($0) }
        if input.isEmpty {
            parsing.searchStocks.removeAll()
            parsing.parsing(reloadTableView: reloadcollectionViewStocks)
        } else {
            parsing.searchParsing(input: input , reloadTableView: self.reloadcollectionViewStocks)
        }
    }
}


