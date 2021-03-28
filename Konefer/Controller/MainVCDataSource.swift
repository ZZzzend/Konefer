//
//  MainVCDataSource.swift
//  Konefer
//
//  Created by Владислав on 27.02.2021.
//

import UIKit

extension MainViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView {
        case collectionViewNames:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuCollViewCell",                                           for: indexPath) as! MenuCollViewCell
            if self.selected == indexPath.item {
                cell.setupCell(index: indexPath.item, isSelected: true)
            } else {
                cell.setupCell(index: indexPath.item, isSelected: false)
            }
            
            return cell
            
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StocksCollViewCell", for:                                                  indexPath) as! StocksCollViewCell
            
            cell.fullScreenHandler = fullScreenHandler
            if indexPath.row == 0 {
                cell.setupCell(stocks: self.parsing.stocks, isFavorite: false)
            } else {
                cell.setupCell(stocks: self.parsing.stocks, isFavorite: true)
            }
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch collectionView {
        case collectionViewNames: return 2
        case collectionViewStocks: return 2
        default: return 0
        }
    }
    
}
