//
//  LoadingTableViewCell.swift
//  Konefer
//
//  Created by Владислав on 29.03.2021.
//

import UIKit

class LoadingTableViewCell: UITableViewCell {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var favoriteIsEmptyLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setupCell(isFavoriteCell: Bool) {
        if isFavoriteCell {
            activityIndicator.isHidden = true
            favoriteIsEmptyLabel.isHidden = false
        } else {
            activityIndicator.isHidden = false
            favoriteIsEmptyLabel.isHidden = true
        }
    }
    
}
