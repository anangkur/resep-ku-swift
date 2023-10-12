//
//  KeywordRepositoryImpl.swift
//  Resep Ku
//
//  Created by Anang Kurniawan on 11/10/23.
//

import Foundation

class KeywordRepositoryImpl : KeywordRepository {
    
    private var dbManager: DBManager
    
    init(dbManager: DBManager) {
        self.dbManager = dbManager
    }
    
    func insertKeyword(keyword: String) {
        dbManager.insertKeyword(keyword: keyword)
    }
    
    func readKeyword() -> [String] {
        return dbManager.getKeyword()
    }
    
    
}
