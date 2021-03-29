//
//  StocksTableViewCell.swift
//  Konefer
//
//  Created by Владислав on 27.02.2021.
//

import UIKit


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
        
        if let logo = UIImage(named: "\(symbol)") {
            self.logo.image = logo
        } else {
            self.logo.image = UIImage(systemName: "questionmark.circle.fill")
        }
        
        var value = ""
        
        switch currency {
        case "USD":
            value = "$"
        case "RUB":
            value = "₽"
        case "EUR":
            value = "€"
        default:
            value = "?"
        }
        
        self.symbol.text = symbol
        self.shortName.text = shortName
        
        if regularMarketPrice == 0.00 {
            self.regularMarketPrice.text = ""
            self.regularMarketChange.text = ""
        } else {
            self.regularMarketPrice.text = value + String(format: "%.2f", regularMarketPrice)
            self.regularMarketChange.text = value + String(format: "%.2f", abs(regularMarketChange)) + " " + "(\(String(format: "%.2f", abs(regularMarketChangePercent)))%)"
            
            if regularMarketChange < 0 {
                self.regularMarketChange.textColor = .red
                self.regularMarketChange.text = "-" + self.regularMarketChange.text!
            } else {
                self.regularMarketChange.textColor = .systemGreen
                self.regularMarketChange.text = "+" + self.regularMarketChange.text!
            }
        }
        
        if isFavorite {
            self.favorite.image = UIImage(systemName: "star.fill")
        } else {
            self.favorite.image = UIImage(systemName: "star")
        }
        
        self.favorite.isHidden = favoriteIsHidden
        
    }
    
}
