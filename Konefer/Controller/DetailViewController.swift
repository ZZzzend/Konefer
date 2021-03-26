//
//  DetailViewController.swift
//  Konefer
//
//  Created by Владислав on 26.03.2021.
//

import UIKit
import RealmSwift

class DetailViewController: UIViewController {
    
    @IBOutlet weak var favoriteButton: UIBarButtonItem!
    
    var stocksRealm: Results<StocksDataRealm>!
    
    var currency = ""
    var name = ""
    var regularMarketChange = 0.0
    var regularMarketChangePercent = 0.0
    var regularMarketPrice = 0.0
    var symbol = ""
    var isFavorite = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func settings(currency: String, name: String, regularMarketChange: Double, regularMarketChangePercent: Double, regularMarketPrice: Double, symbol: String, isFavorite: Bool) {
        
        self.currency = currency
        self.name = name
        self.regularMarketChange = regularMarketChange
        self.regularMarketChangePercent = regularMarketChangePercent
        self.regularMarketPrice = regularMarketPrice
        self.symbol = symbol
        self.isFavorite = isFavorite
        
        if isFavorite {
            favoriteButton.image = UIImage(systemName: "star.fill")
        } else {
            favoriteButton.image = UIImage(systemName: "star")
        }
    }

    @IBAction func isFavoriteAction(_ sender: Any) {
        
        if isFavorite {
            favoriteButton.image = UIImage(systemName: "star")
        } else {
            favoriteButton.image = UIImage(systemName: "star.fill")
        }
        
        isFavorite = !isFavorite
        
        let stocksData = realm.object(ofType: StocksDataRealm.self, forPrimaryKey: symbol)
        
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
