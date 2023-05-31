//
//  SearchRecipeResponse.swift
//  Resep Ku
//
//  Created by Anang Kurniawan on 31/05/23.
//

import Foundation

struct SearchRecipeResponse: Decodable {
    let meals: [RecipeResponse]?
}
