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
        
        self.title = "Resep Ku"
    }

    func didUpdateRecipes(recipes: [RecipeResponse]?) {
        DispatchQueue.main.async {
            self.recipe = recipes ?? []
            self.recipeTable.reloadData()
        }
    }
    
    func didFailWithError(error: Error?) {
        DispatchQueue.main.async {
            print("didFailWithError: \(error.debugDescription)")
        }
    }
    
    private func goToDetailRecipe(recipeResponse: RecipeResponse) {
        self.navigationController?.pushViewController(DetailRecipeViewController(recipeResponse: recipeResponse), animated: true)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipe.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReuseIdentifier", for: indexPath) as! RecipeCell
        let recipeResponse = recipe[indexPath.row]
        cell.labelTitle.text = recipeResponse.strMeal ?? "-"
        cell.labeltag.text = recipeResponse.strTags ?? "-"
        cell.labelCategory.text = recipeResponse.strCategory ?? "-"
        cell.fetchImage(urlString: recipeResponse.strMealThumb ?? "")
        cell.onClickItem = {
            self.goToDetailRecipe(recipeResponse: recipeResponse)
        }
        return cell
    }
}
