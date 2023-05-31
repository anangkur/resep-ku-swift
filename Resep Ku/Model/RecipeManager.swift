//
//  RecipeManager.swift
//  Resep Ku
//
//  Created by Anang Kurniawan on 31/05/23.
//

import Foundation

protocol RecipeManagerDelegate {
    func didUpdateRecipes(recipes: [RecipeResponse]?)
    func didFailWithError(error: Error?)
}

struct RecipeManager {
    
    let baseUrl = "https://www.themealdb.com/api/json/v1/1"
    
    var delegate: RecipeManagerDelegate?
    
    func fetchRecipe(q: String) {
        let urlString = "\(baseUrl)/search.php?s=\(q)"
        performRequest(urlString: urlString)
    }
    
    private func performRequest(urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url, completionHandler: handle(data: urlResponse: error: ))
            task.resume()
        }
    }
    
    private func handle(data: Data?, urlResponse: URLResponse?, error: Error?) {
        if (error != nil) {
            DispatchQueue.main.async {
                delegate?.didFailWithError(error: error)
            }
            return
        }
        
        if let safeData = data {
            if let searchRecipeResponse = parseJson(data: safeData) {
                DispatchQueue.main.async {
                    delegate?.didUpdateRecipes(recipes: searchRecipeResponse.meals)
                }
            }
        }
    }
    
    private func parseJson(data: Data) -> SearchRecipeResponse? {
        let jsonDecoder = JSONDecoder()
        var returnValue: SearchRecipeResponse? = nil
        do {
            try returnValue = jsonDecoder.decode(SearchRecipeResponse.self, from: data)
        } catch {
            DispatchQueue.main.async {
                delegate?.didFailWithError(error: error)
            }
        }
        return returnValue
    }

}
