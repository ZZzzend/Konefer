//
//  DataProvider.swift
//  Konefer
//
//  Created by Владислав on 20.02.2021.
//

import UIKit

class DataProvider: NSObject {
    var dataManager = DataManager()
}

extension DataProvider: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CVStocksAndFavourite", for: indexPath) as! CVStocksAndFavourite
        
        return cell
    }
}

extension DataProvider: UICollectionViewDelegate {
    
}
