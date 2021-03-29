//
//  ActionsWithRealmObjects.swift
//  Konefer
//
//  Created by Владислав on 26.03.2021.
//

import RealmSwift

class ActionsWithRealmObjects {
    
    final func saveObjects(stocks: [StocksData], remove: (), reload: @escaping () -> ()) {
        
        
        _ = stocks.map {
            let stocksData = realm.object(ofType: StocksDataRealm.self, forPrimaryKey: $0.symbol)
            
            let newStock = StocksDataRealm(currency: $0.currency!, name: $0.shortName!, regularMarketPrice: $0.regularMarketPrice!, regularMarketChange: $0.regularMarketChange!, regularMarketChangePercent: $0.regularMarketChangePercent!, symbol: $0.symbol!, isFavorite: false)
            
            if let stock = stocksData  {
                try! realm.write {
                    stock.currency = newStock.currency
                    stock.name = newStock.name
                    stock.regularMarketPrice = newStock.regularMarketPrice
                    stock.regularMarketChange = newStock.regularMarketChange
                    stock.regularMarketChangePercent = newStock.regularMarketChangePercent
                }
            } else {
                StorageManager.saveObject(newStock)
            }
        }
        
        remove
        reload()
    }
}
