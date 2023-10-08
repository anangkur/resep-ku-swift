//
//  MainPresenter.swift
//  Resep Ku
//
//  Created by Anang Kurniawan on 08/10/23.
//

import Foundation

class MainPresenter {
    
    private var view: MainView
    
    private var recipeManager: RecipeManager
    private var recipeRepository: RecipeRepository
    
    init(view: MainView) {
        self.view = view
        self.recipeManager = RecipeManager()
        self.recipeRepository = RecipeRepositoryImpl(recipeManager: self.recipeManager)
    }
    
    func fetchRecipe(q: String) {
        recipeRepository.fetchRecipe(
            q: q,
            onSuccess: { (recipeResponseList: [RecipeResponse]?) -> Void in
                self.view.didUpdateRecipes(
                    recipes: recipeResponseList?.map({ RecipeResponse in
                        RecipeResponse.toRecipe()
                    })
                )
            },
            onFail: { (error: Error?) -> Void in
                self.view.didFailWithError(error: error)
            }
        )
    }
}
