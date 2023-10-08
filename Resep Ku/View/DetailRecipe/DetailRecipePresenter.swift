//
//  DetailRecipePresenter.swift
//  Resep Ku
//
//  Created by Anang Kurniawan on 08/10/23.
//

import Foundation

class DetailRecipePresenter {
    
    private var view: DetailRecipeView
    
    private var databaseManager: DBManager
    private var thumbnailManager: ThumbnailManager
    
    private var favoriteRepository: FavoriteRecipeRepository
    
    init(view: DetailRecipeView) {
        self.view = view
        self.databaseManager = DBManager()
        self.thumbnailManager = ThumbnailManager()
        self.favoriteRepository = FavoriteRecipeRepositoryImpl(databaseManager: databaseManager)
    }
    
    func insertRecipe(recipe: Recipe) {
        favoriteRepository.insertRecipe(recipe: recipe.toRecipeObject())
    }
    
    func deleteRecipe(recipeId: String) {
        favoriteRepository.deleteRecipe(recipeId: recipeId)
    }
    
    func isFavorite(recipeId: String) -> Bool {
        return favoriteRepository.loadRecipe(recipeId: recipeId) != nil
    }
    
    func fetchThumbnail(urlString: String) {
        thumbnailManager.fetchThumbnail(
            urlString: urlString,
            onSuccess: { (data: Data?) -> Void in
                self.view.didUpdateThumbnail(data: data)
            },
            onFail: { (error: Error?) -> Void in
                self.view.didFailWithError(error: error)
            }
        )
    }
}
