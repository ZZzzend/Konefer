//
//  Model.swift
//  Konefer
//
//  Created by Владислав on 04.03.2021.
//

import Foundation

struct StocksData: Codable {
    
    var currency: String?
    var shortName: String?
    var regularMarketChange: Double?
    var regularMarketChangePercent: Double?
    var regularMarketPrice: Double?
    var symbol: String?
}

struct QuoteResponse: Codable {
    var result: [StocksData]
}

struct ResultsStocks: Codable {
    var quoteResponse: QuoteResponse
}
