//
//  StocksTableViewCell.swift
//  Konefer
//
//  Created by Владислав on 27.02.2021.
//

import UIKit
import Kingfisher

class StocksTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var symbol: UILabel!
    @IBOutlet weak var shortName: UILabel!
    @IBOutlet weak var regularMarketPrice: UILabel!
    @IBOutlet weak var regularMarketChange: UILabel!
    @IBOutlet weak var favorite: UIImageView!
    
    // MARK: - Initializers
    override func awakeFromNib() {
        super.awakeFromNib()
        logo.layer.masksToBounds = true
        logo.layer.cornerRadius = logo.frame.size.width / 5
    }
    
    // MARK: - Final Methods
    final func setupCell(currency: String, symbol: String, shortName: String, regularMarketPrice: Double, regularMarketChange: Double, regularMarketChangePercent: Double, isFavorite: Bool, favoriteIsHidden: Bool) {
        
        self.symbol.text = symbol
        self.shortName.text = shortName
        
        if isFavorite {
            self.favorite.image = UIImage(systemName: "star.fill")
        } else {
            self.favorite.image = UIImage(systemName: "star")
        }
        
        self.favorite.isHidden = favoriteIsHidden
        
        setLogo(symbol: symbol)
        setPrice(regularMarketPrice: regularMarketPrice, regularMarketChange: regularMarketChange, regularMarketChangePercent: regularMarketChangePercent, currency: currency)
    }
    
    
    private func setLogo(symbol: String) {
        if let logo = UIImage(named: "\(symbol)") {
            self.logo.contentMode = .scaleAspectFill
            self.logo.image = logo
        } else {
            
            let url = URL(string: "https://finnhub.io/api/logo?symbol=\(symbol)")
            self.logo.contentMode = .scaleAspectFit
            self.logo.kf.setImage(with: url,
                                  placeholder: UIImage(named: "Question"))
        }
    }
    
    private func setPrice(regularMarketPrice: Double, regularMarketChange: Double, regularMarketChangePercent: Double, currency: String) {
        if regularMarketPrice == 0.00 {
            self.regularMarketPrice.text = ""
            self.regularMarketChange.text = ""
        } else {
            
            let formatter = NumberFormatter()
            formatter.numberStyle = .currency
            formatter.currencyCode = currency
            
            self.regularMarketPrice.text = formatter.string(from: NSNumber(value: regularMarketPrice))
            self.regularMarketChange.text = formatter.string(from: NSNumber(value: abs(Int(regularMarketChange))))! + " " + "(\(String(format: "%.2f", abs(regularMarketChangePercent)))%)"

            
            if regularMarketChange < 0 {
                self.regularMarketChange.textColor = .red
                self.regularMarketChange.text = "-" + self.regularMarketChange.text!
            } else {
                self.regularMarketChange.textColor = .systemGreen
                self.regularMarketChange.text = "+" + self.regularMarketChange.text!
            }
        }
    }
    
}
