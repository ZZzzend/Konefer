//
//  ViewController.swift
//  Konefer
//
//  Created by Владислав on 19.02.2021.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var collectionViewNames: UICollectionView!
    @IBOutlet weak var collectionViewStocks: UICollectionView!
    
    // MARK: - Initializers
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configCollectionView()
        configCVStocks()
    }
    
    // MARK: - Private Methods
    private func configCollectionView() {
        self.collectionViewNames.register(UINib(nibName: "MenuCollViewCell", bundle: nil), forCellWithReuseIdentifier: "MenuCollViewCell")
        self.collectionViewNames.dataSource = self
        self.collectionViewNames.delegate = self
    }
    
    private func configCVStocks() {
        self.collectionViewStocks.register(UINib(nibName: "StocksCollViewCell", bundle: nil), forCellWithReuseIdentifier: "StocksCollViewCell")
        self.collectionViewStocks.dataSource = self
        self.collectionViewStocks.delegate = self
    }
}


