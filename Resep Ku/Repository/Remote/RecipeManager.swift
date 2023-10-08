//
//  RecipeManager.swift
//  Resep Ku
//
//  Created by Anang Kurniawan on 31/05/23.
//

import Foundation

struct RecipeManager {
    
    let baseUrl = "https://www.themealdb.com/api/json/v1/1"
    
    func fetchRecipe(
        q: String,
        onSuccess: @escaping ([RecipeResponse]?) -> Void,
        onFail: @escaping (Error?) -> Void
    ) {
        let urlString = "\(baseUrl)/search.php?s=\(q)"
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if (error != nil) {
                    onFail(error)
                    return
                }
                
                if let safeData = data {
                    if let searchRecipeResponse = parseJson(data: safeData, onFail: onFail) {
                        onSuccess(searchRecipeResponse.meals)
                    }
                }
            }
            task.resume()
        }
    }
    
    private func parseJson(
        data: Data,
        onFail: (Error?) -> Void
    ) -> SearchRecipeResponse? {
        let jsonDecoder = JSONDecoder()
        var returnValue: SearchRecipeResponse? = nil
        do {
            try returnValue = jsonDecoder.decode(SearchRecipeResponse.self, from: data)
        } catch {
            onFail(error)
        }
        return returnValue
    }

}
