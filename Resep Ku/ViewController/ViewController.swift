//
//  ViewController.swift
//  Resep Ku
//
//  Created by Anang Kurniawan on 29/05/23.
//

import UIKit

class ViewController: UIViewController, RecipeManagerDelegate, UITextFieldDelegate {

    @IBOutlet weak var labelEmpty: UILabel!
    @IBOutlet weak var viewEmpty: UIView!
    @IBOutlet weak var textFieldSearch: UITextField!
    @IBOutlet weak var recipeTable: UITableView!
    
    private let defaultError = "Unknown Error"
    private var query = ""
    
    var recipeManager = RecipeManager()
    
    var recipe: [RecipeResponse] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        recipeTable.dataSource = self
        recipeManager.delegate = self
        textFieldSearch.delegate = self
        
        recipeTable.register(UINib(nibName: "RecipeCell", bundle: nil), forCellReuseIdentifier: "ReuseIdentifier")
        
        recipeManager.fetchRecipe(q: query)
        
        self.title = "Resep Ku"
    }

    func didUpdateRecipes(recipes: [RecipeResponse]?) {
        if (recipes?.count ?? 0 <= 0) {
            DispatchQueue.main.async {
                self.showErrorView(error: "Search \"\(self.query)\" Not Found")
            }
        } else {
            DispatchQueue.main.async {
                self.showRecipes(recipes: recipes ?? [])
            }
        }
    }
    
    private func showErrorView(error: String) {
        self.viewEmpty.isHidden = false
        self.recipeTable.isHidden = true
        self.labelEmpty.text = error
    }
    
    private func showRecipes(recipes: [RecipeResponse]) {
        self.viewEmpty.isHidden = true
        self.recipeTable.isHidden = false
        self.recipe = recipes
        self.recipeTable.reloadData()
    }
    
    func didFailWithError(error: Error?) {
        DispatchQueue.main.async {
            self.showErrorView(error: error?.localizedDescription ?? self.defaultError)
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        query = textField.text ?? ""
        self.view.endEditing(true)
        return search(query: query)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.text = ""
    }
    
    private func search(query: String) -> Bool {
        if (query.isEmpty() || query.isBlank()) {
            return false
        } else {
            recipeManager.fetchRecipe(q: query)
            return true
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
        cell.labelDescription.text = recipeResponse.createDescription()
        cell.labelTags.text = recipeResponse.strTags
        cell.fetchImage(urlString: recipeResponse.strMealThumb ?? "")
        cell.onClickItem = {
            self.goToDetailRecipe(recipeResponse: recipeResponse)
        }
        return cell
    }
}
