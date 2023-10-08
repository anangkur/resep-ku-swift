//
//  RecipeRepositoryImpl.swift
//  Resep Ku
//
//  Created by Anang Kurniawan on 08/10/23.
//

import Foundation

class RecipeRepositoryImpl : RecipeRepository {
    
    private var recipeManager: RecipeManager
    
    init(recipeManager: RecipeManager) {
        self.recipeManager = recipeManager
    }
    
    func fetchRecipe(
        q: String,
        onSuccess: @escaping ([RecipeResponse]?) -> Void,
        onFail: @escaping (Error?) -> Void
    ) {
        recipeManager.fetchRecipe(q: q, onSuccess: onSuccess, onFail: onFail)
    }
}
