//
//  ParsingData.swift
//  Konefer
//
//  Created by Владислав on 04.03.2021.
//

import Foundation

class ParsingData {
    
    var stocks = [DataCompany]()
    
    func parsing() {
        let urlString = "https://finnhub.io/api/v1/stock/symbol?exchange=US&token=c10qpqv48v6pp7cht0eg"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            guard error == nil else { return }

            
            do {
                let model = try JSONDecoder().decode(([DataCompany].self), from: data)
                self.stocks = model
                print("ok")
            } catch let error {
                print(error)
            }
        }.resume()
    }
}
