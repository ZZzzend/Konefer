//
//  StocksTableViewCell.swift
//  Konefer
//
//  Created by Владислав on 27.02.2021.
//

import UIKit

class StocksTableViewCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet weak var ticker: UILabel!
    @IBOutlet weak var nameCompany: UILabel!
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
    }
    
    func setupCell(ticker: String, nameCompany: String) {
        self.ticker.text = ticker
        self.nameCompany.text = nameCompany
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
