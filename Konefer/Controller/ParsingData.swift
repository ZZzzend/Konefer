//
//  ParsingData.swift
//  Konefer
//
//  Created by Владислав on 04.03.2021.
//

import Foundation

class ParsingData {
    
    var stocks = [StocksData]()
    var tickers = ["AAPL", "MSFT", "AMZN", "FB", "JPM", "JNJ", "GOOG", "AAPL", "GOOGL", "XOM", "BAC", "WFC", "INTC", "T", "V", "CSCO", "CVX", "UNH", "PFE", "HD", "PG", "VZ", "C", "ABBV", "BA", "KO", "CMCSA", "MA", "PM", "DWDP", "PEP", "ORCL", "DIS", "MRK", "NVDA", "MMM", "AMGN", "IBM", "NFLX", "WMT", "MO", "MCD", "GE", "HON", "MDT", "ABT", "TXN", "AAPL", "BMY", "ADBE", "UNP", "GILD", "BKNG", "AVGO", "ACN", "UTX", "GS", "SLB", "CAT", "PYPL", "QCOM", "CRM", "NKE", "TMO", "USB", "SBUX", "LMT", "COST", "MS", "PNC", "LLY", "UPS", "TWX", "NEE", "CELG", "LOW", "BLK", "CVS", "AXP", "MU", "CHTR", "SCHW", "MDLZ", "CB", "COP", "AMAT", "DHR", "AMT", "CL", "GD", "FDX", "RTN", "WBA", "NOC", "BIIB", "BDX", "ANTM", "AET", "EOG", "BK", "ATVI"]
    
    //    func parsing() {
    //        let urlString = "https://finnhub.io/api/v1/stock/symbol?exchange=US&token=c10qpqv48v6pp7cht0eg"
    //        guard let url = URL(string: urlString) else { return }
    //
    //        URLSession.shared.dataTask(with: url) { (data, response, error) in
    //            guard let data = data else { return }
    //            guard error == nil else { return }
    //
    //
    //            do {
    //                let model = try JSONDecoder().decode(([DataCompany].self), from: data)
    //                self.stocks = model
    //                print("ok")
    //            } catch let error {
    //                print(error)
    //            }
    //        }.resume()
    //    }
    
    
    func parsing() {
        let symbols = tickers.joined(separator: "%2C")
        
        let headers = [
            "x-rapidapi-key": "37e9e36db3mshef1b09f4e690a87p19b99ajsn025825ba0cc5",
            "x-rapidapi-host": "apidojo-yahoo-finance-v1.p.rapidapi.com"
        ]

        let request = NSMutableURLRequest(url: NSURL(string: "https://apidojo-yahoo-finance-v1.p.rapidapi.com/market/v2/get-quotes?region=US&symbols=\(symbols)")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) in
            
            guard let unwrappedData = data else { return }
            
            do {
               // let str = try JSONSerialization.jsonObject(with: unwrappedData, options: .allowFragments)
             //   let str = String(data: unwrappedData, encoding: .utf8)
               // print("lol: \(str!)")
                let model = try JSONDecoder().decode(ResultsStocks.self, from: unwrappedData)
                self.stocks = model.quoteResponse.result
                print(self.stocks)
            } catch {
                print("json error: \(error)")
            }
//            if (error != nil) {
//                print(error)
//            } else {
//                let httpResponse = response as? HTTPURLResponse
//              //  let str = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
//                print(httpResponse)
//
//                print(str)
//            }
        })

        dataTask.resume()
    }
}
