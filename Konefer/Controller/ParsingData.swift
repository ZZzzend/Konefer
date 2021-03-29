//
//  ParsingData.swift
//  Konefer
//
//  Created by Владислав on 04.03.2021.
//

import Foundation

class ParsingData {
    
    // MARK: - Public Properties
    public var stocks = [StocksData]()
    public var searchStocks = [SearchData]()
    
    // MARK: - Private Properties
    private weak var lastSearchDataTask: URLSessionDataTask?
    private let saveObjects = ActionsWithRealmObjects()
    
    private var tickers = ["YNDX","AAPL", "MSFT", "AMZN", "FB", "JPM", "JNJ", "GOOG", "GOOGL", "XOM", "BAC", "WFC", "INTC", "T", "V", "CSCO", "CVX", "UNH", "PFE", "HD", "PG", "VZ", "C", "ABBV", "BA", "KO", "CMCSA", "MA", "PM", "DWDP", "PEP", "ORCL", "DIS", "MRK", "NVDA", "MMM", "AMGN", "IBM", "NFLX", "WMT", "MO", "MCD", "GE", "HON", "MDT", "ABT", "TXN", "ADBE", "UNP", "GILD", "BKNG", "AVGO", "ACN", "UTX", "GS", "SLB", "CAT", "PYPL", "QCOM", "CRM", "NKE", "TMO", "USB", "SBUX", "LMT", "COST","BMY", "MS", "PNC", "LLY", "UPS", "TWX", "NEE", "CELG", "LOW", "BLK", "CVS", "AXP", "MU", "CHTR", "SCHW", "MDLZ", "CB", "COP", "AMAT", "DHR", "AMT", "CL", "GD", "FDX", "RTN", "WBA", "NOC", "BIIB", "BDX", "ANTM", "AET", "EOG", "BK", "ATVI", "CME", "AGN", "MON", "SYK", "DUK", "ITW", "ADP", "TJX", "DE", "CSX", "SPGI", "AIG", "MET", "CTSH", "OXY", "ISRG", "SPG", "GM", "COF", "PRU", "D", "PX", "EMR", "CCI", "ICE", "VRTX", "SO", "BBT", "ESRX", "MMC", "MAR", "INTU", "F", "EBAY", "ZTS", "NSC", "VLO", "CI", "PSX", "HAL", "KHC", "KMB", "STT", "FOXA", "HPQ", "STZ", "EA", "HUM", "BSX", "TGT", "TRV", "DAL", "APD", "TEL", "ILMN", "AON", "LRCX", "JCI", "EXC", "ETN", "ECL", "AFL", "LYB", "WM", "PGR", "ADI", "ALL", "STI", "SHW", "BAX", "MPC", "PLD", "FIS", "MCK", "LUV", "EL", "APC", "AEP", "EQIX", "KMI", "FISV", "WDC", "HPE", "DXC", "ADSK", "PPG", "ROST", "EW", "GIS", "PSA", "HCA", "SYY", "MTB", "PXD", "ROP", "APH", "TROW", "DFS", "MCO", "YUM", "RHT", "SRE", "CCL", "SYF", "ALXN", "WY", "REGN", "GLW", "CMI", "ADM", "FCX", "APTV", "MNST", "AAL", "VFC", "FITB", "PH", "PEG", "ROK", "FTV", "SWK", "AMP", "OKE", "ZBH", "PCAR", "ED", "KEY", "DG", "NTRS", "WMB", "PCG", "MCHP", "RF", "A", "CAH", "MYL", "IP", "CFG", "TSN", "IR", "DLTR", "CXO", "AVB", "XEL", "COL", "WLTW", "EQR", "DLR", "RCL", "DPS", "KR", "NUE", "ORLY", "PAYX", "SWKS", "SBAC", "NEM", "EIX", "WELL", "CERN", "HIG", "ALGN", "BXP", "WEC", "XLNX", "HRS", "CBS", "KLAC", "PPL", "UAL", "GPN", "MGM", "BBY", "AME", "DTE", "VTR", "IDXX", "AZO", "INFO", "ES", "MSI", "LH", "NTAP", "CNC", "HBAN", "CMA", "STX", "K", "OMC", "DVN", "WRK", "CTL", "LNC", "SYMC", "WAT", "CLX", "ABC", "PFG", "INCY", "HLT", "FAST", "LEN", "VRSK", "FOX", "LLL", "EMN", "VMC", "MTD", "RSG", "ETFC", "CAG", "TXT", "MHK", "URI", "DOV", "ESS", "IQV", "DHI", "CTAS", "TSS", "SJM", "TPR", "XL", "WYNN", "TAP", "EFX", "NBL", "FE", "BLL", "O", "DGX", "GWW", "AWK", "TDG", "HSY", "ANSS", "CBG", "ANDV", "NOV", "L", "XYL", "IVZ", "RMD", "BF.B", "HST", "NWL", "ETR", "CTXS", "CBOE", "GPC", "MAS", "EXPE", "GGP", "APA", "XRAY", "MLM", "FTI", "SNPS", "MKC", "AEE", "CHD", "BEN", "EQT", "CHRW", "BHGE", "HES", "AJG", "AKAM", "RJF", "MRO", "WYN", "COG", "CMS", "ARE", "ULTA", "WHR", "LKQ", "HII", "DRI", "VAR", "VNO", "KMX", "KSU", "EXPD", "PNR", "CNP", "VIAB", "PVH", "UNM", "PRGO", "COO", "IT", "ALB", "CA", "KSS", "PKG", "ZION", "CINF", "NCLH", "ADS", "CDNS", "NLSN", "IFF", "AMG", "FMC", "UHS", "DVA", "HOLX", "EXR", "HSIC", "VRSN", "RE", "JBHT", "HCP", "QRVO", "ARNC", "LB", "TIF", "AVY", "HAS", "BWA", "MAA", "SLG", "JNPR", "NDAQ", "IPGP", "AOS", "MOS", "TMK", "FFIV", "WU", "FBHS", "KORS", "AMD", "UDR", "CF", "IPG", "DISH", "NRG", "M", "DRE", "COTY", "HRL", "LNT", "IRM", "SNA", "XEC", "REG", "AAP", "FRT", "CPB", "ALK", "PNW", "PKI", "TSCO", "PHM", "CMG", "ALLE", "SEE", "LUK", "FLR", "HOG", "NI", "RHI", "HBI", "GPS", "JEC", "GT", "DISCK", "GRMN", "FLIR", "AES", "PBCT", "HP", "XRX", "CSRA", "AYI", "MAC", "LEG", "AIV", "NWSA", "RL", "KIM", "JWN", "FLS", "HRB", "SCG", "FL", "SRCL", "PWR", "BHF", "EVHC", "AIZ", "MAT", "TRIP", "NFX", "DISCA", "NAVI", "RRC", "UAA", "SIG", "CHK", "UAA", "PDCO", "NWS"]
    
    // MARK: - Final Methods
    final func parsing(reloadTableView: @escaping () -> ()) {
        
        let symbols: String
        let search = searchStocks.map { $0.symbol ?? "" }.joined(separator: "%2C")
        
        if search == "" {
            symbols = tickers.joined(separator: "%2C")
            searchStocks.removeAll()
        } else {
            symbols = search
        }
        
        let headers = [
            "x-rapidapi-key": "d4a2612258mshf07eaadf1df804ap12a49cjsnc672eba41fb0",
            "x-rapidapi-host": "apidojo-yahoo-finance-v1.p.rapidapi.com"
        ]
        
        guard let url = NSURL(string: "https://apidojo-yahoo-finance-v1.p.rapidapi.com/market/v2/get-quotes?region=US&symbols=\(symbols)") else { return }
        
        let request = NSMutableURLRequest(url: url as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        lastSearchDataTask?.cancel()
        
        let session = URLSession.shared
        lastSearchDataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) in
            
            guard let unwrappedData = data else { return }
            guard error == nil else { return }
            
            do {
                //  let str = String(data: unwrappedData, encoding: .utf8)
                //  print("data: \(str!)")
                let model = try JSONDecoder().decode(ResultsStocks.self, from: unwrappedData)
                self.stocks = model.quoteResponse.result
                print(self.stocks)
                
                DispatchQueue.main.async {
                    if search == "" {
                        self.saveObjects.saveObjects(stocks: self.stocks, remove: self.stocks.removeAll(), reload: reloadTableView)
                    } else {
                        reloadTableView()
                    }
                }
                
            } catch {
                print("json error: \(error)")
            }
        })
        
        lastSearchDataTask?.resume()
    }
    
    final func searchParsing(input: String, reloadTableView: @escaping () -> ()) {
        
        searchStocks.removeAll()
        
        guard !input.isEmpty else { return }
        
        let headers = [
            "x-rapidapi-key": "d4a2612258mshf07eaadf1df804ap12a49cjsnc672eba41fb0",
            "x-rapidapi-host": "apidojo-yahoo-finance-v1.p.rapidapi.com"
        ]
        
        guard let url = NSURL(string: "https://apidojo-yahoo-finance-v1.p.rapidapi.com/market/auto-complete?query=\(input)&region=US") else { return }
        
        let request = NSMutableURLRequest(url: url as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        lastSearchDataTask?.cancel()
        
        let session = URLSession.shared
        lastSearchDataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) in
            
            guard let unwrappedData = data else { return }
            guard error == nil else { return }
            
            do {
                //  let str = String(data: unwrappedData, encoding: .utf8)
                //    print("data: \(str!)")
                let model = try JSONDecoder().decode(ResultSearch.self, from: unwrappedData)
                self.searchStocks = model.ResultSet.Result
                self.parsing(reloadTableView: reloadTableView)
                print("Работает")
                
            } catch {
                print("json error: \(error)")
            }
        })
        
        lastSearchDataTask?.resume()
    }
}
