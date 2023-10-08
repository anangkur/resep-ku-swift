//
//  RecipeRepository.swift
//  Resep Ku
//
//  Created by Anang Kurniawan on 08/10/23.
//

import Foundation

protocol RecipeRepository {
    func fetchRecipe(
        q: String,
        onSuccess: @escaping ([RecipeResponse]?) -> Void,
        onFail: @escaping (Error?) -> Void
    )
}
