//
//  DetailViewController.swift
//  Konefer
//
//  Created by Владислав on 26.03.2021.
//

import UIKit
import RealmSwift
import Kingfisher

class DetailViewController: UIViewController {
    
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var symbolStock: UILabel!
    @IBOutlet weak var nameStock: UILabel!
    @IBOutlet weak var favoriteButtonStock: UIButton!
    
    private var stocksRealm: Results<StocksDataRealm>!
    
    private var currency = ""
    private var name = ""
    private var regularMarketChange = 0.0
    private var regularMarketChangePercent = 0.0
    private var regularMarketPrice = 0.0
    private var symbol = ""
    private var isFavorite = false

    override func viewDidLoad() {
        super.viewDidLoad()
        setOutlets()
        changeInitButton()
    }
    
    // MARK: - Final Methods
    final func settings(currency: String, name: String, regularMarketChange: Double, regularMarketChangePercent: Double, regularMarketPrice: Double, symbol: String, isFavorite: Bool) {
        
        self.currency = currency
        self.name = name
        self.regularMarketChange = regularMarketChange
        self.regularMarketChangePercent = regularMarketChangePercent
        self.regularMarketPrice = regularMarketPrice
        self.symbol = symbol
        self.isFavorite = isFavorite
    }
    
    @IBAction func favoriteActionStock(_ sender: Any) {
        isFavorite = changeButton(isFavorite)
        saveOrChangeData(symbol)
    }
    
    // MARK: - Private Methods
    private func changeInitButton() {
        if !self.isFavorite {
            favoriteButtonStock.backgroundColor = .systemGray6
            favoriteButtonStock.setTitle("To favorites", for: .normal)
            favoriteButtonStock.setTitleColor(.black, for: .normal)
        } else {
            favoriteButtonStock.backgroundColor = .systemBlue
            favoriteButtonStock.setTitle("In favorites", for: .normal)
            favoriteButtonStock.setTitleColor(.white, for: .normal)
        }
    }
    
    private func setOutlets() {
        
        if let logo = UIImage(named: "\(symbol)") {
            self.logo.image = logo
        } else {
            let url = URL(string: "https://finnhub.io/api/logo?symbol=\(symbol)")
            self.logo.kf.setImage(with: url, placeholder: UIImage(systemName: "questionmark.circle.fill"))
        }
        
        self.symbolStock.text = symbol
        self.nameStock.text = name
    }
    
    private func changeButton(_ isChange: Bool) -> Bool {
        if isChange {
            favoriteButtonStock.backgroundColor = .systemGray6
            favoriteButtonStock.setTitle("To favorites", for: .normal)
            favoriteButtonStock.setTitleColor(.black, for: .normal)
        } else {
            favoriteButtonStock.backgroundColor = .systemBlue
            favoriteButtonStock.setTitle("In favorites", for: .normal)
            favoriteButtonStock.setTitleColor(.white, for: .normal)
        }
        
        return !isChange
    }
    
    private func saveOrChangeData(_ forPrimaryKey: String) {
        let stocksData = realm.object(ofType: StocksDataRealm.self, forPrimaryKey: forPrimaryKey)
        
        let newStock = StocksDataRealm(currency: currency, name: name, regularMarketPrice: regularMarketPrice, regularMarketChange: regularMarketChange, regularMarketChangePercent: regularMarketChangePercent, symbol: symbol, isFavorite: isFavorite)
        
        if let stock = stocksData  {
            try! realm.write {
                stock.isFavorite = newStock.isFavorite
            }
        } else {
            StorageManager.saveObject(newStock)
        }
    }
    
}
