//
//  MenuCollViewCell.swift
//  Konefer
//
//  Created by Владислав on 19.02.2021.
//

import UIKit

class MenuCollViewCell: UICollectionViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var listLabel: UILabel!
    
    // MARK: - Private Properties
    private let tabsMenu = ["Stocks", "Favorite"]
    
    // MARK: - Initializers
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupCell(index: Int, isSelected: Bool) {
        listLabel.text = tabsMenu[index]
        
        if isSelected {
            listLabel.font = UIFont.boldSystemFont(ofSize: 28)
        } else {
            listLabel.font = UIFont.systemFont(ofSize: 18)
        }
    }
    
}
