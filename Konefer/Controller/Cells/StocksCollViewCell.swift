//
//  StocksCollViewCell.swift
//  Konefer
//
//  Created by Владислав on 27.02.2021.
//

import UIKit
import RealmSwift

class StocksCollViewCell: UICollectionViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var tableViewStocks: UITableView!
    
    // MARK: - Private Properties
    private var stocks = [StocksData]()
    var stocksRealm: Results<StocksDataRealm>!
    
    // MARK: - Public Properties
    var fullScreenHandler: ((_ currency: String, _ shortName: String, _ regularMarketChange: Double, _ regularMarketChangePercent: Double, _ regularMarketPrice: Double, _ symbol: String, _ isFavorite: Bool) -> Void)?
    
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
    
    func setupCell(stocks: [StocksData], isFavorite: Bool) {
        self.stocks = stocks
        if isFavorite {
            stocksRealm = realm.objects(StocksDataRealm.self).filter("isFavorite == true")
        } else {
            stocksRealm = realm.objects(StocksDataRealm.self).sorted(byKeyPath: "regularMarketPrice", ascending: false)
        }
        tableViewStocks.reloadData()
    }
    
}

extension StocksCollViewCell: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if !stocks.isEmpty {
            return stocks.count
        } else {
            return stocksRealm.count
        }
        // return stocks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StocksTableViewCell", for: indexPath) as! StocksTableViewCell
        
        if !stocks.isEmpty {
            
            cell.setupCell(currency: stocks[indexPath.item].currency ?? "", symbol: stocks[indexPath.item].symbol ?? "", shortName: stocks[indexPath.item].shortName ?? "", regularMarketPrice: stocks[indexPath.item].regularMarketPrice ?? 0, regularMarketChange: stocks[indexPath.item].regularMarketChange ?? 0, regularMarketChangePercent: stocks[indexPath.item].regularMarketChangePercent ?? 0, isFavorite: false, favoriteIsHidden: true)
        } else {
            
            let stocks = stocksRealm[indexPath.row]
            
            cell.setupCell(currency: stocks.currency, symbol: stocks.symbol, shortName: stocks.name, regularMarketPrice: stocks.regularMarketPrice, regularMarketChange: stocks.regularMarketChange, regularMarketChangePercent: stocks.regularMarketChangePercent, isFavorite: stocks.isFavorite, favoriteIsHidden: false)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}

extension StocksCollViewCell: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableViewStocks.deselectRow(at: indexPath, animated: true)
        
        
        if stocks.isEmpty {
            let stocks = stocksRealm[indexPath.row]
            fullScreenHandler!(stocks.currency, stocks.name, stocks.regularMarketChange, stocks.regularMarketChangePercent, stocks.regularMarketPrice, stocks.symbol, stocks.isFavorite)
        } else {
            fullScreenHandler!(self.stocks[indexPath.row].currency ?? "", self.stocks[indexPath.row].shortName ?? "", self.stocks[indexPath.row].regularMarketChange ?? 0.0, self.stocks[indexPath.row].regularMarketChangePercent ?? 0.0, self.stocks[indexPath.row].regularMarketPrice ?? 0.0, self.stocks[indexPath.row].symbol ?? "", false)
        }
    }
}
