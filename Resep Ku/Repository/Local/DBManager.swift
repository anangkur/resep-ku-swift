//
//  LocalDBImpl.swift
//  Resep Ku
//
//  Created by Anang Kurniawan on 05/10/23.
//

import Foundation
import RealmSwift

class DBManager {
    
    private var database: Realm
    
    init() {
        database = try! Realm()
    }
    
    func getRecipe(recipeId: String) -> RecipeObject? {
        let recipe = database.object(
            ofType: RecipeObject.self,
            forPrimaryKey: recipeId
        )
        return recipe
    }
    
    func insertRecipe(recipe: RecipeObject) {
        try! database.write {
            database.add(recipe, update: .all)
        }
    }
    
    func deleteRecipe(recipeId: String) {
        let recipe = getRecipe(recipeId: recipeId)
        if let safeRecipe = recipe {
            try! database.write {
                database.delete(safeRecipe)
            }
        }
    }
    
    func getAllRecipe() -> [RecipeObject] {
        return Array(database.objects(RecipeObject.self))
    }
}
