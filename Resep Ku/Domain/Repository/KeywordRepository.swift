//
//  KeywordRepository.swift
//  Resep Ku
//
//  Created by Anang Kurniawan on 11/10/23.
//

import Foundation

protocol KeywordRepository {
    func insertKeyword(keyword: String)
    func readKeyword() -> [String]
}
