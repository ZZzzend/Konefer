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
                cell.setupCell(index: indexPath.item)
                return cell
                
            default:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StocksCollViewCell", for:                                                  indexPath) as! StocksCollViewCell
                
                
             //   if !parsing.searchStocks.isEmpty {
             //       cell.setupCellSearch(stocks: self.parsing.searchStocks)
             //   } else {
              //      if indexPath.row == 0 {
                        cell.setupCell(stocks: self.parsing.stocks)
                //    }
                //}
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
