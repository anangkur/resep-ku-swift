//
//  FavoritePresenter.swift
//  Resep Ku
//
//  Created by Anang Kurniawan on 10/10/23.
//

import Foundation

class FavoritePresenter {
    
    private var view: FavoriteView
    private var dbManager: DBManager
    
    init(view: FavoriteView) {
        self.view = view
        self.dbManager = DBManager()
    }
    
    func fetchFavoriteRecipes() {
        view.favoriteFetched(
            favoriteRecipes: dbManager.getAllRecipe().map({ RecipeObject in
                RecipeObject.toRecipe()
            })
        )
    }
}
