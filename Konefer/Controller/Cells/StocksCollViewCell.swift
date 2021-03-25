//
//  StocksCollViewCell.swift
//  Konefer
//
//  Created by Владислав on 27.02.2021.
//

import UIKit

class StocksCollViewCell: UICollectionViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var tableViewStocks: UITableView!
    
    // MARK: - Private Properties
    private var stocks = [StocksData]()
    private var searchStocks = [SearchData]()
    
    // MARK: - Initializers
    override func awakeFromNib() {
        super.awakeFromNib()
        configTableViewStocks()
    }
    
    func configTableViewStocks() {
        tableViewStocks.register(UINib(nibName: "StocksTableViewCell", bundle: nil), forCellReuseIdentifier: "StocksTableViewCell")
        tableViewStocks.dataSource = self
        tableViewStocks.delegate = self
    }
    
    func setupCell(stocks: [StocksData]) {
        self.stocks = stocks
        tableViewStocks.reloadData()
    }
    
    func setupCellSearch(stocks: [SearchData]) {
        self.searchStocks = stocks
        tableViewStocks.reloadData()
    }

}

extension StocksCollViewCell: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchStocks.isEmpty {
            return stocks.count
        } else {
            return searchStocks.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StocksTableViewCell", for: indexPath) as! StocksTableViewCell
        
        if searchStocks.isEmpty {
            cell.setupCell(currency: stocks[indexPath.item].currency ?? "", symbol: stocks[indexPath.item].symbol ?? "", shortName: stocks[indexPath.item].shortName ?? "", regularMarketPrice: stocks[indexPath.item].regularMarketPrice ?? 0, regularMarketChange: stocks[indexPath.item].regularMarketChange ?? 0, regularMarketChangePercent: stocks[indexPath.item].regularMarketChangePercent ?? 0)
        } else {
            cell.setupSearchCell(symbol: searchStocks[indexPath.row].symbol ?? "", name: searchStocks[indexPath.row].name ?? "")
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}

extension StocksCollViewCell: UITableViewDelegate { }
