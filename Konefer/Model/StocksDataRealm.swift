//
//  StocksDataRealm.swift
//  Konefer
//
//  Created by Владислав on 26.03.2021.
//

import RealmSwift

class StocksDataRealm: Object {
    @objc dynamic var currency: String = "",
                      name: String = "",
                      regularMarketChange: Double = 0.0,
                      regularMarketChangePercent: Double = 0.0,
                      regularMarketPrice: Double = 0.0,
                      symbol: String = "",
                      isFavorite: Bool = false
    
    
    convenience init(currency: String, name: String, regularMarketPrice: Double, regularMarketChange: Double, regularMarketChangePercent: Double, symbol: String, isFavorite: Bool) {
        self.init()
        self.currency = currency
        self.name = name
        self.regularMarketChange = regularMarketChange
        self.regularMarketChangePercent = regularMarketChangePercent
        self.regularMarketPrice = regularMarketPrice
        self.symbol = symbol
        self.isFavorite = isFavorite
    }
    
    override static func primaryKey() -> String? {
        return "symbol"
    }
}
