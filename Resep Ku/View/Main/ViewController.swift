//
//  ViewController.swift
//  Resep Ku
//
//  Created by Anang Kurniawan on 29/05/23.
//

import UIKit

class ViewController: UIViewController, MainView, UITextFieldDelegate {

    @IBOutlet weak var labelEmpty: UILabel!
    @IBOutlet weak var viewEmpty: UIView!
    @IBOutlet weak var textFieldSearch: UITextField!
    @IBOutlet weak var recipeTable: UITableView!
    
    private let defaultError = "Unknown Error"
    private var query = ""
    
    private var mainPresenter: MainPresenter? = nil
    
    private var recipe: [Recipe] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mainPresenter = MainPresenter(view: self)
        self.recipeTable.dataSource = self
        self.textFieldSearch.delegate = self
        
        recipeTable.register(
            UINib(nibName: "RecipeCell", bundle: nil),
            forCellReuseIdentifier: "ReuseIdentifier"
        )
        
        self.title = "Resep Ku"
        
        mainPresenter?.fetchRecipe(q: query)
    }

    func didUpdateRecipes(recipes: [Recipe]?) {
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
    
    private func showRecipes(recipes: [Recipe]) {
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
    
    private func search(query: String) -> Bool {
        mainPresenter?.fetchRecipe(q: query)
        return true
    }
    
    private func goToDetailRecipe(recipe: Recipe) {
        self.navigationController?.pushViewController(
            DetailRecipeViewController(recipe: recipe),
            animated: true
        )
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipe.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "ReuseIdentifier",
            for: indexPath
        ) as! RecipeCell
        let recipe = recipe[indexPath.row]
        cell.labelTitle.text = recipe.strMeal ?? "-"
        cell.labelDescription.text = recipe.createDescription()
        cell.labelTags.text = recipe.strTags
        cell.fetchImage(urlString: recipe.strMealThumb ?? "")
        cell.onClickItem = {
            self.goToDetailRecipe(recipe: recipe)
        }
        return cell
    }
}
