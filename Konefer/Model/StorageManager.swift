//
//  StorageManager.swift
//  Konefer
//
//  Created by Владислав on 26.03.2021.
//

import RealmSwift

let realm = try! Realm()

class StorageManager {
    
    static func saveObject(_ stock: StocksDataRealm) {
        
        try! realm.write {
            realm.add(stock)
        }
    }
    
    static func deleteObject(_ stock: StocksDataRealm) {
        
        try! realm.write {
            realm.delete(stock)
        }
    }
}
