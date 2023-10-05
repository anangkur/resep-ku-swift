//
//  RecipeObject.swift
//  Resep Ku
//
//  Created by Anang Kurniawan on 05/10/23.
//

import Foundation
import RealmSwift

class RecipeObject : Object {
    
    convenience init(
        idMeal: String? = nil,
        strMeal: String? = nil,
        strCategory: String? = nil,
        strArea: String? = nil,
        strInstructions: String? = nil,
        strMealThumb: String? = nil,
        strTags: String? = nil,
        strYoutube: String? = nil,
        strIngredient1: String? = nil,
        strIngredient2: String? = nil,
        strIngredient3: String? = nil,
        strIngredient4: String? = nil,
        strIngredient5: String? = nil,
        strIngredient6: String? = nil,
        strIngredient7: String? = nil,
        strIngredient8: String? = nil,
        strIngredient9: String? = nil,
        strIngredient10: String? = nil,
        strIngredient11: String? = nil,
        strIngredient12: String? = nil,
        strIngredient13: String? = nil,
        strIngredient14: String? = nil,
        strIngredient15: String? = nil,
        strIngredient16: String? = nil,
        strIngredient17: String? = nil,
        strIngredient18: String? = nil,
        strIngredient19: String? = nil,
        strIngredient20: String? = nil,
        strMeasure1: String? = nil,
        strMeasure2: String? = nil,
        strMeasure3: String? = nil,
        strMeasure4: String? = nil,
        strMeasure5: String? = nil,
        strMeasure6: String? = nil,
        strMeasure7: String? = nil,
        strMeasure8: String? = nil,
        strMeasure9: String? = nil,
        strMeasure10: String? = nil,
        strMeasure11: String? = nil,
        strMeasure12: String? = nil,
        strMeasure13: String? = nil,
        strMeasure14: String? = nil,
        strMeasure15: String? = nil,
        strMeasure16: String? = nil,
        strMeasure17: String? = nil,
        strMeasure18: String? = nil,
        strMeasure19: String? = nil,
        strMeasure20: String? = nil,
        strSource: String? = nil
    ) {
        self.init()
        self.idMeal = idMeal
        self.strMeal = strMeal
        self.strCategory = strCategory
        self.strArea = strArea
        self.strInstructions = strInstructions
        self.strMealThumb = strMealThumb
        self.strTags = strTags
        self.strYoutube = strYoutube
        self.strIngredient1 = strIngredient1
        self.strIngredient2 = strIngredient2
        self.strIngredient3 = strIngredient3
        self.strIngredient4 = strIngredient4
        self.strIngredient5 = strIngredient5
        self.strIngredient6 = strIngredient6
        self.strIngredient7 = strIngredient7
        self.strIngredient8 = strIngredient8
        self.strIngredient9 = strIngredient9
        self.strIngredient10 = strIngredient10
        self.strIngredient11 = strIngredient11
        self.strIngredient12 = strIngredient12
        self.strIngredient13 = strIngredient13
        self.strIngredient14 = strIngredient14
        self.strIngredient15 = strIngredient15
        self.strIngredient16 = strIngredient16
        self.strIngredient17 = strIngredient17
        self.strIngredient18 = strIngredient18
        self.strIngredient19 = strIngredient19
        self.strIngredient20 = strIngredient20
        self.strMeasure1 = strMeasure1
        self.strMeasure2 = strMeasure2
        self.strMeasure3 = strMeasure3
        self.strMeasure4 = strMeasure4
        self.strMeasure5 = strMeasure5
        self.strMeasure6 = strMeasure6
        self.strMeasure7 = strMeasure7
        self.strMeasure8 = strMeasure8
        self.strMeasure9 = strMeasure9
        self.strMeasure10 = strMeasure10
        self.strMeasure11 = strMeasure11
        self.strMeasure12 = strMeasure12
        self.strMeasure13 = strMeasure13
        self.strMeasure14 = strMeasure14
        self.strMeasure15 = strMeasure15
        self.strMeasure16 = strMeasure16
        self.strMeasure17 = strMeasure17
        self.strMeasure18 = strMeasure18
        self.strMeasure19 = strMeasure19
        self.strMeasure20 = strMeasure20
        self.strSource = strSource
    }
    
    @Persisted(primaryKey: true)
    var idMeal: String?
    @Persisted
    var strMeal: String?
    @Persisted
    var strCategory: String?
    @Persisted
    var strArea: String?
    @Persisted
    var strInstructions: String?
    @Persisted
    var strMealThumb: String?
    @Persisted
    var strTags: String?
    @Persisted
    var strYoutube: String?
    @Persisted
    var strIngredient1: String?
    @Persisted
    var strIngredient2: String?
    @Persisted
    var strIngredient3: String?
    @Persisted
    var strIngredient4: String?
    @Persisted
    var strIngredient5: String?
    @Persisted
    var strIngredient6: String?
    @Persisted
    var strIngredient7: String?
    @Persisted
    var strIngredient8: String?
    @Persisted
    var strIngredient9: String?
    @Persisted
    var strIngredient10: String?
    @Persisted
    var strIngredient11: String?
    @Persisted
    var strIngredient12: String?
    @Persisted
    var strIngredient13: String?
    @Persisted
    var strIngredient14: String?
    @Persisted
    var strIngredient15: String?
    @Persisted
    var strIngredient16: String?
    @Persisted
    var strIngredient17: String?
    @Persisted
    var strIngredient18: String?
    @Persisted
    var strIngredient19: String?
    @Persisted
    var strIngredient20: String?
    @Persisted
    var strMeasure1: String?
    @Persisted
    var strMeasure2: String?
    @Persisted
    var strMeasure3: String?
    @Persisted
    var strMeasure4: String?
    @Persisted
    var strMeasure5: String?
    @Persisted
    var strMeasure6: String?
    @Persisted
    var strMeasure7: String?
    @Persisted
    var strMeasure8: String?
    @Persisted
    var strMeasure9: String?
    @Persisted
    var strMeasure10: String?
    @Persisted
    var strMeasure11: String?
    @Persisted
    var strMeasure12: String?
    @Persisted
    var strMeasure13: String?
    @Persisted
    var strMeasure14: String?
    @Persisted
    var strMeasure15: String?
    @Persisted
    var strMeasure16: String?
    @Persisted
    var strMeasure17: String?
    @Persisted
    var strMeasure18: String?
    @Persisted
    var strMeasure19: String?
    @Persisted
    var strMeasure20: String?
    @Persisted
    var strSource: String?
}
