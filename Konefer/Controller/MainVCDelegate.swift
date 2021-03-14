//
//  MainVCDelegate.swift
//  Konefer
//
//  Created by Владислав on 27.02.2021.
//

import UIKit

extension MainViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView {
        case collectionViewStocks:
            return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
        default:
            return CGSize(width: 80, height: 15)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == collectionViewNames {
          //  self.groupsCollectionView.reloadData()
            self.collectionViewStocks.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
}
