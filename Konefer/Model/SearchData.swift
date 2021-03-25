//
//  SearchData.swift
//  Konefer
//
//  Created by Владислав on 24.03.2021.
//

import Foundation

struct SearchData: Codable {
    var symbol: String?
    var name: String?
}

struct ResultSet: Codable {
    var Result: [SearchData]
}

struct ResultSearch: Codable {
    var ResultSet: ResultSet
}
