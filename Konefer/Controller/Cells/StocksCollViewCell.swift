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
    
    // MARK: - Initializers
    override func awakeFromNib() {
        super.awakeFromNib()
        stocksRealm = realm.objects(StocksDataRealm.self)
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

}

extension StocksCollViewCell: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stocksRealm.count
           // return stocks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StocksTableViewCell", for: indexPath) as! StocksTableViewCell
        
//            cell.setupCell(currency: stocks[indexPath.item].currency ?? "", symbol: stocks[indexPath.item].symbol ?? "", shortName: stocks[indexPath.item].shortName ?? "", regularMarketPrice: stocks[indexPath.item].regularMarketPrice ?? 0, regularMarketChange: stocks[indexPath.item].regularMarketChange ?? 0, regularMarketChangePercent: stocks[indexPath.item].regularMarketChangePercent ?? 0)
        let stocks = stocksRealm[indexPath.row]
        
        cell.setupCell(currency: stocks.currency, symbol: stocks.symbol, shortName: stocks.name, regularMarketPrice: stocks.regularMarketPrice, regularMarketChange: stocks.regularMarketChange, regularMarketChangePercent: stocks.regularMarketChangePercent)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}

extension StocksCollViewCell: UITableViewDelegate { }
