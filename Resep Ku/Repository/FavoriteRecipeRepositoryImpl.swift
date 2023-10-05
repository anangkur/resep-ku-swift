//
//  FavoriteRecipeRepositoryImpl.swift
//  Resep Ku
//
//  Created by Anang Kurniawan on 05/10/23.
//

import Foundation

class FavoriteRecipeRepositoryImpl : FavoriteRecipeRepository {
    
    private var databaseManager: DBManager
    static let sharedInstance = FavoriteRecipeRepositoryImpl()
    
    private init() {
        self.databaseManager = DBManager.sharedInstance
    }
    
    func insertRecipe(recipe: RecipeObject) {
        databaseManager.insertRecipe(recipe: recipe)
    }
    
    func loadRecipe(recipeId: String) -> RecipeObject? {
        return databaseManager.getRecipe(recipeId: recipeId)
    }
    
    func deleteRecipe(recipeId: String) {
        databaseManager.deleteRecipe(recipeId: recipeId)
    }
}
