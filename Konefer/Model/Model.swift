//
//  Model.swift
//  Konefer
//
//  Created by Владислав on 04.03.2021.
//

import Foundation

struct DataCompany: Decodable {
    var currency: String?
    var description: String?
    var displaySymbol: String?
}

//struct DataCompany: Decodable {
//    var displaySymbol: String?  // ticker
//    var description: String?  //name
//    var price: String?
//    var priceChangePerDay: String?
//    var favorites: Bool?
//}
