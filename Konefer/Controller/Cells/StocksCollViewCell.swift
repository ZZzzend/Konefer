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
    private var stocks = [DataCompany]()
    
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
    
    func setupCell(stocks: [DataCompany]) {
        self.stocks = stocks
        tableViewStocks.reloadData()
    }

}

extension StocksCollViewCell: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stocks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StocksTableViewCell", for: indexPath) as! StocksTableViewCell
        cell.setupCell(ticker: self.stocks[indexPath.item].displaySymbol ?? "", nameCompany: self.stocks[indexPath.item].description ?? "")
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}

extension StocksCollViewCell: UITableViewDelegate { }
