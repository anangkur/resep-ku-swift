//
//  FavoriteView.swift
//  Resep Ku
//
//  Created by Anang Kurniawan on 10/10/23.
//

import Foundation

protocol FavoriteView {
    func showError(error: Error?)
    func favoriteFetched(favoriteRecipes: [Recipe])
}
