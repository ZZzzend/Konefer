//
//  StocksTableViewCell.swift
//  Konefer
//
//  Created by Владислав on 27.02.2021.
//

import UIKit


class StocksTableViewCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet weak var symbol: UILabel!
    @IBOutlet weak var shortName: UILabel!
    @IBOutlet weak var regularMarketPrice: UILabel!
    @IBOutlet weak var regularMarketChange: UILabel!
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
    }
    
    func setupCell(currency: String, symbol: String, shortName: String, regularMarketPrice: Double, regularMarketChange: Double, regularMarketChangePercent: Double) {
        
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
        self.regularMarketPrice.text = value + String(format: "%.2f", regularMarketPrice)
        self.regularMarketChange.text = value + String(format: "%.2f", abs(regularMarketChange)) + " " + "(\(String(format: "%.2f", abs(regularMarketChangePercent)))%)"
        
        if regularMarketChange < 0 {
            self.regularMarketChange.textColor = .red
            self.regularMarketChange.text = "-" + self.regularMarketChange.text!
        } else {
            self.regularMarketChange.textColor = .systemGreen
        }
      //  self.nameCompany.text = nameCompany
    }
    
    func setupSearchCell(symbol: String, name: String) {
        self.symbol.text = symbol
        self.shortName.text = name
        self.regularMarketPrice.text = ""
        self.regularMarketChange.text = ""
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
