//
//  Recipe.swift
//  Resep Ku
//
//  Created by Anang Kurniawan on 08/10/23.
//

import Foundation

struct Recipe {
    let idMeal: String?
    let strMeal: String?
    let strCategory: String?
    let strArea: String?
    let strInstructions: String?
    let strMealThumb: String?
    let strTags: String?
    let strYoutube: String?
    let strIngredient1: String?
    let strIngredient2: String?
    let strIngredient3: String?
    let strIngredient4: String?
    let strIngredient5: String?
    let strIngredient6: String?
    let strIngredient7: String?
    let strIngredient8: String?
    let strIngredient9: String?
    let strIngredient10: String?
    let strIngredient11: String?
    let strIngredient12: String?
    let strIngredient13: String?
    let strIngredient14: String?
    let strIngredient15: String?
    let strIngredient16: String?
    let strIngredient17: String?
    let strIngredient18: String?
    let strIngredient19: String?
    let strIngredient20: String?
    let strMeasure1: String?
    let strMeasure2: String?
    let strMeasure3: String?
    let strMeasure4: String?
    let strMeasure5: String?
    let strMeasure6: String?
    let strMeasure7: String?
    let strMeasure8: String?
    let strMeasure9: String?
    let strMeasure10: String?
    let strMeasure11: String?
    let strMeasure12: String?
    let strMeasure13: String?
    let strMeasure14: String?
    let strMeasure15: String?
    let strMeasure16: String?
    let strMeasure17: String?
    let strMeasure18: String?
    let strMeasure19: String?
    let strMeasure20: String?
    let strSource: String?
    
    func createDescription() -> String {
        var result = ""
        
        if let safeCategory = strCategory {
            if (!safeCategory.isEmpty() && !safeCategory.isBlank()) {
                result.append(safeCategory)
            }
        }
        
        if let safeArea = strArea {
            if (!safeArea.isEmpty() && !safeArea.isBlank()) {
                result.append(" - ")
                result.append(safeArea)
            }
        }
        
        return result
    }
    
    func createRecipients() -> String {
        var result = ""
        
        if let safeStrIngridients1 = strIngredient1 {
            if (!safeStrIngridients1.isEmpty() && !safeStrIngridients1.isBlank()) {
                result.append(safeStrIngridients1)
                result.append(" ")
            }
        }
        if let safeMeasure1 = strMeasure1 {
            if (safeMeasure1 != "" && safeMeasure1 != " ") {
                result.append("(")
                result.append(safeMeasure1)
                result.append(")")
                result.append("\n")
            }
        }
        
        if let safeStrIngridients2 = strIngredient2 {
            if (safeStrIngridients2 != "" && safeStrIngridients2 != " ") {
                result.append(safeStrIngridients2)
                result.append(" ")
            }
        }
        if let safeMeasure2 = strMeasure2 {
            if (safeMeasure2 != "" && safeMeasure2 != " ") {
                result.append("(")
                result.append(safeMeasure2)
                result.append(")")
                result.append("\n")
            }
        }
        
        if let safeStrIngridients3 = strIngredient3 {
            if (safeStrIngridients3 != "" && safeStrIngridients3 != " ") {
                result.append(safeStrIngridients3)
                result.append(" ")
            }
        }
        if let safeMeasure3 = strMeasure3 {
            if (safeMeasure3 != "" && safeMeasure3 != " ") {
                result.append("(")
                result.append(safeMeasure3)
                result.append(")")
                result.append("\n")
            }
        }
        
        if let safeStrIngridients4 = strIngredient4 {
            if (safeStrIngridients4 != "" && safeStrIngridients4 != " ") {
                result.append(safeStrIngridients4)
                result.append(" ")
            }
        }
        if let safeMeasure4 = strMeasure4 {
            if (safeMeasure4 != "" && safeMeasure4 != " ") {
                result.append("(")
                result.append(safeMeasure4)
                result.append(")")
                result.append("\n")
            }
        }
        
        if let safeStrIngridients5 = strIngredient5 {
            if (safeStrIngridients5 != "" && safeStrIngridients5 != " ") {
                result.append(safeStrIngridients5)
                result.append(" ")
            }
        }
        if let safeMeasure5 = strMeasure5 {
            if (safeMeasure5 != "" && safeMeasure5 != " ") {
                result.append("(")
                result.append(safeMeasure5)
                result.append(")")
                result.append("\n")
            }
        }
        
        if let safeStrIngridients6 = strIngredient6 {
            if (safeStrIngridients6 != "" && safeStrIngridients6 != " ") {
                result.append(safeStrIngridients6)
                result.append(" ")
            }
        }
        if let safeMeasure6 = strMeasure6 {
            if (safeMeasure6 != "" && safeMeasure6 != " ") {
                result.append("(")
                result.append(safeMeasure6)
                result.append(")")
                result.append("\n")
            }
        }
        
        if let safeStrIngridients7 = strIngredient7 {
            if (safeStrIngridients7 != "" && safeStrIngridients7 != " ") {
                result.append(safeStrIngridients7)
                result.append(" ")
            }
        }
        if let safeMeasure7 = strMeasure7 {
            if (safeMeasure7 != "" && safeMeasure7 != " ") {
                result.append("(")
                result.append(safeMeasure7)
                result.append(")")
                result.append("\n")
            }
        }
        
        if let safeStrIngridients8 = strIngredient8 {
            if (safeStrIngridients8 != "" && safeStrIngridients8 != " ") {
                result.append(safeStrIngridients8)
                result.append(" ")
            }
        }
        if let safeMeasure8 = strMeasure8 {
            if (safeMeasure8 != "" && safeMeasure8 != " ") {
                result.append("(")
                result.append(safeMeasure8)
                result.append(")")
                result.append("\n")
            }
        }
        
        if let safeStrIngridients9 = strIngredient9 {
            if (safeStrIngridients9 != "" && safeStrIngridients9 != " ") {
                result.append(safeStrIngridients9)
                result.append(" ")
            }
        }
        if let safeMeasure9 = strMeasure9 {
            if (safeMeasure9 != "" && safeMeasure9 != " ") {
                result.append("(")
                result.append(safeMeasure9)
                result.append(")")
                result.append("\n")
            }
        }
        
        if let safeStrIngridients10 = strIngredient10 {
            if (safeStrIngridients10 != "" && safeStrIngridients10 != " ") {
                result.append(safeStrIngridients10)
                result.append(" ")
            }
        }
        if let safeMeasure10 = strMeasure10 {
            if (safeMeasure10 != "" && safeMeasure10 != " ") {
                result.append("(")
                result.append(safeMeasure10)
                result.append(")")
                result.append("\n")
            }
        }
        
        if let safeStrIngridients11 = strIngredient11 {
            if (safeStrIngridients11 != "" && safeStrIngridients11 != " ") {
                result.append(safeStrIngridients11)
                result.append(" ")
            }
        }
        if let safeMeasure11 = strMeasure11 {
            if (safeMeasure11 != "" && safeMeasure11 != " ") {
                result.append("(")
                result.append(safeMeasure11)
                result.append(")")
                result.append("\n")
            }
        }
        
        if let safeStrIngridients12 = strIngredient12 {
            if (safeStrIngridients12 != "" && safeStrIngridients12 != " ") {
                result.append(safeStrIngridients12)
                result.append(" ")
            }
        }
        if let safeMeasure12 = strMeasure12 {
            if (safeMeasure12 != "" && safeMeasure12 != " ") {
                result.append("(")
                result.append(safeMeasure12)
                result.append(")")
                result.append("\n")
            }
        }
        
        if let safeStrIngridients13 = strIngredient13 {
            if (safeStrIngridients13 != "" && safeStrIngridients13 != " ") {
                result.append(safeStrIngridients13)
                result.append(" ")
            }
        }
        if let safeMeasure13 = strMeasure13 {
            if (safeMeasure13 != "" && safeMeasure13 != " ") {
                result.append("(")
                result.append(safeMeasure13)
                result.append(")")
                result.append("\n")
            }
        }
        
        if let safeStrIngridients14 = strIngredient14 {
            if (safeStrIngridients14 != "" && safeStrIngridients14 != " ") {
                result.append(safeStrIngridients14)
                result.append(" ")
            }
        }
        if let safeMeasure14 = strMeasure14 {
            if (safeMeasure14 != "" && safeMeasure14 != " ") {
                result.append("(")
                result.append(safeMeasure14)
                result.append(")")
                result.append("\n")
            }
        }
        
        if let safeStrIngridients15 = strIngredient15 {
            if (safeStrIngridients15 != "" && safeStrIngridients15 != " ") {
                result.append(safeStrIngridients15)
                result.append(" ")
            }
        }
        if let safeMeasure15 = strMeasure15 {
            if (safeMeasure15 != "" && safeMeasure15 != " ") {
                result.append("(")
                result.append(safeMeasure15)
                result.append(")")
                result.append("\n")
            }
        }
        
        if let safeStrIngridients16 = strIngredient16 {
            if (safeStrIngridients16 != "" && safeStrIngridients16 != " ") {
                result.append(safeStrIngridients16)
                result.append(" ")
            }
        }
        if let safeMeasure16 = strMeasure16 {
            if (safeMeasure16 != "" && safeMeasure16 != " ") {
                result.append("(")
                result.append(safeMeasure16)
                result.append(")")
                result.append("\n")
            }
        }
        
        if let safeStrIngridients17 = strIngredient17 {
            if (safeStrIngridients17 != "" && safeStrIngridients17 != " ") {
                result.append(safeStrIngridients17)
                result.append(" ")
            }
        }
        if let safeMeasure17 = strMeasure17 {
            if (safeMeasure17 != "" && safeMeasure17 != " ") {
                result.append("(")
                result.append(safeMeasure17)
                result.append(")")
                result.append("\n")
            }
        }
        
        if let safeStrIngridients18 = strIngredient18 {
            if (safeStrIngridients18 != "" && safeStrIngridients18 != " ") {
                result.append(safeStrIngridients18)
                result.append(" ")
            }
        }
        if let safeMeasure18 = strMeasure18 {
            if (safeMeasure18 != "" && safeMeasure18 != " ") {
                result.append("(")
                result.append(safeMeasure18)
                result.append(")")
                result.append("\n")
            }
        }
        
        if let safeStrIngridients19 = strIngredient19 {
            if (safeStrIngridients19 != "" && safeStrIngridients19 != " ") {
                result.append(safeStrIngridients19)
                result.append(" ")
            }
        }
        if let safeMeasure19 = strMeasure19 {
            if (safeMeasure19 != "" && safeMeasure19 != " ") {
                result.append("(")
                result.append(safeMeasure19)
                result.append(")")
                result.append("\n")
            }
        }
        
        if let safeStrIngridients20 = strIngredient20 {
            if (safeStrIngridients20 != "" && safeStrIngridients20 != " ") {
                result.append(safeStrIngridients20)
                result.append(" ")
            }
        }
        if let safeMeasure20 = strMeasure20 {
            if (safeMeasure20 != "" && safeMeasure20 != " ") {
                result.append("(")
                result.append(safeMeasure20)
                result.append(")")
                result.append("\n")
            }
        }
        
        return result
    }
}
