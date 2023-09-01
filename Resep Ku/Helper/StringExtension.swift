//
//  StringExtension.swift
//  Resep Ku
//
//  Created by Anang Kurniawan on 01/09/23.
//

import Foundation

extension String {
    func isEmpty() -> Bool {
        return self == ""
    }
    
    func isBlank() -> Bool {
        return self == " "
    }
}
