//
//  MainPresenter.swift
//  Resep Ku
//
//  Created by Anang Kurniawan on 08/10/23.
//

import Foundation

class MainPresenter {
    
    private var view: MainView
    
    private var dbManager: DBManager
    private var recipeRepository: RecipeRepository
    private var keywordRepository: KeywordRepository
    
    init(view: MainView) {
        self.view = view
        self.dbManager = DBManager()
        self.recipeRepository = RecipeRepositoryImpl(recipeManager: RecipeManager())
        self.keywordRepository = KeywordRepositoryImpl(dbManager: dbManager)
    }
    
    func fetchRecipe(q: String) {
        if (!q.isEmpty() && !q.isBlank()) {
            keywordRepository.insertKeyword(keyword: q)
        }
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
    
    func fetchKeyword() {
        view.didUpdateKeyword(keywords: keywordRepository.readKeyword())
    }
}
