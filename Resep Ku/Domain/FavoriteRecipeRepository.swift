//
//  RecipeRepository.swift
//  Resep Ku
//
//  Created by Anang Kurniawan on 05/10/23.
//

import Foundation

protocol FavoriteRecipeRepository {
    func insertRecipe(recipe: RecipeObject)
    func loadRecipe(recipeId: String) -> RecipeObject?
    func deleteRecipe(recipeId: String)
}
