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
    private let search = UISearchController(searchResultsController: nil)
    private lazy var reloadcollectionViewStocks = { self.collectionViewStocks.reloadData() }
    
    // MARK: - Public Properties
    public var parsing = ParsingData()
    public var selected = 0
    
    // MARK: - Initializers
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configSearchController()
        configcollectionViewNames()
        configCollectionViewStocks()
        
    //    parsing.parsing(reloadTableView: reloadcollectionViewStocks)
    }
    
    override func viewWillAppear(_ animated: Bool) {
      //  configSearchController()
        collectionViewStocks.reloadData()
    }
    
    // MARK: - Private Methods
    private func configSearchController() {
        search.searchResultsUpdater = self
        search.obscuresBackgroundDuringPresentation = false
        search.searchBar.placeholder = "Search name or ticker"
        
    //    search.searchBar.sizeToFit()
    //    search.searchBar.becomeFirstResponder()
        self.navigationItem.searchController = search
     //   definesPresentationContext = true
        self.navigationItem.hidesSearchBarWhenScrolling = false
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
                self.selected = indexPath.item
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
            parsing.stocks.removeAll()
            self.collectionViewStocks.reloadData()
        } else {
            parsing.searchParsing(input: input , reloadTableView: self.reloadcollectionViewStocks)
        }
    }
}

extension MainViewController {
    func fullScreenHandler(_ currency: String, shortName: String, _ regularMarketChange: Double, _ regularMarketChangePercent: Double, _ regularMarketPrice: Double, _ symbol: String, _ isFavorite: Bool) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "DetailViewController") as! DetailViewController
        vc.settings(currency: currency, name: shortName, regularMarketChange: regularMarketChange, regularMarketChangePercent: regularMarketChangePercent, regularMarketPrice: regularMarketPrice, symbol: symbol, isFavorite: isFavorite)
        
        parsing.searchStocks.removeAll()
        parsing.stocks.removeAll()
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
}


