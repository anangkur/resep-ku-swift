//
//  ViewController.swift
//  Resep Ku
//
//  Created by Anang Kurniawan on 29/05/23.
//

import UIKit

class ViewController: UIViewController, RecipeManagerDelegate {

    @IBOutlet weak var recipeTable: UITableView!
    
    var recipeManager = RecipeManager()
    
    var recipe: [RecipeResponse] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        recipeTable.dataSource = self
        recipeManager.delegate = self
        
        recipeTable.register(UINib(nibName: "RecipeCell", bundle: nil), forCellReuseIdentifier: "ReuseIdentifier")
        
        recipeManager.fetchRecipe(q: "")
    }

    func didUpdateRecipes(recipes: [RecipeResponse]?) {
        recipe = recipes ?? []
        recipeTable.reloadData()
    }
    
    func didFailWithError(error: Error?) {
        print("didFailWithError: \(error.debugDescription)")
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipe.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReuseIdentifier", for: indexPath) as! RecipeCell
        cell.labelTitle.text = recipe[indexPath.row].strMeal ?? "-"
        cell.labeltag.text = recipe[indexPath.row].strTags ?? "-"
        cell.labelCategory.text = recipe[indexPath.row].strCategory ?? "-"
        return cell
    }
}
