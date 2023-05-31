//
//  RecipeResponse.swift
//  Resep Ku
//
//  Created by Anang Kurniawan on 31/05/23.
//

import Foundation

struct RecipeResponse: Decodable {
    let idMeal: String?
    let strMeal: String?
    let strCategory: String?
    let strArea: String?
    let strInstructions: String?
    let strMealThumb: String?
    let strTags: String?
    let strYoutube: String?
}
