//
//  MainView.swift
//  Resep Ku
//
//  Created by Anang Kurniawan on 08/10/23.
//

import Foundation

protocol MainView {
    func didUpdateRecipes(recipes: [Recipe]?)
    func didFailWithError(error: Error?)
}
