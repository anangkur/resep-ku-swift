//
//  KeywordObject.swift
//  Resep Ku
//
//  Created by Anang Kurniawan on 11/10/23.
//

import Foundation
import RealmSwift

class KeywordObject : Object {
    @Persisted(primaryKey: true)
    var keyword: String? = nil
    
    convenience init(keyword: String) {
        self.init()
        self.keyword = keyword
    }
}
