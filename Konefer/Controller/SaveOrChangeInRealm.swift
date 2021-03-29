//
//  saveOrChangeInRealm.swift
//  Konefer
//
//  Created by Владислав on 30.03.2021.
//

import Foundation

class SaveOrChangeObject {
    
    final func saveOrChangeData(currency: String, name: String, regularMarketPrice: Double, regularMarketChange: Double, regularMarketChangePercent: Double, symbol: String, isFavorite: Bool) {
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
