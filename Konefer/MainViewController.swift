//
//  ViewController.swift
//  Konefer
//
//  Created by Владислав on 19.02.2021.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet var dataProvider: DataProvider!
    @IBOutlet weak var collectionViewNames: UICollectionView!
    
    
    // MARK: - Initializers
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ConfigCollectionView()
    }
    
    // MARK: - Private Methods
    private func ConfigCollectionView() {
        self.collectionViewNames.register(UINib(nibName: "CVStocksAndFavourite", bundle: nil), forCellWithReuseIdentifier: "CVStocksAndFavourite")
        self.collectionViewNames.dataSource = dataProvider
        self.collectionViewNames.delegate = dataProvider
    }
}

