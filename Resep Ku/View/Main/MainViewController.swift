//
//  ViewController.swift
//  Resep Ku
//
//  Created by Anang Kurniawan on 29/05/23.
//

import UIKit
import RVS_AutofillTextField

class MainViewController: UIViewController, MainView, UITextFieldDelegate, RVS_AutofillTextFieldDataSource {

    @IBOutlet weak var labelEmpty: UILabel!
    @IBOutlet weak var viewEmpty: UIView!
    @IBOutlet weak var textFieldSearch: RVS_AutofillTextField!
    @IBOutlet weak var recipeTable: UITableView!
    
    private let defaultError = "Unknown Error"
    private var query = ""
    
    private var mainPresenter: MainPresenter? = nil
    
    private var recipe: [Recipe] = []
    private var keywords: [String] = []
    
    internal var textDictionary: [RVS_AutofillTextFieldDataSourceType] {
        var index = 0
        let ret: [RVS_AutofillTextFieldDataSourceType] = keywords.compactMap {
            let currentStr = $0.trimmingCharacters(in: .whitespacesAndNewlines)
            if !currentStr.isEmpty {
                defer { index += 1 }
                return RVS_AutofillTextFieldDataSourceType(value: currentStr, refCon: index)
            }
            return nil
        }
        return ret
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mainPresenter = MainPresenter(view: self)
        self.recipeTable.dataSource = self
        self.textFieldSearch.delegate = self
        self.textFieldSearch.dataSource = self
        self.textFieldSearch.maximumAutofillCount = 3
        
        recipeTable.register(
            UINib(nibName: "RecipeCell", bundle: nil),
            forCellReuseIdentifier: "ReuseIdentifier"
        )
        
        self.title = "Resep Ku"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Favorite",
            style: .plain,
            target: self,
            action: #selector(goToFavoriteRecipe)
        )
        
        mainPresenter?.fetchRecipe(q: query)
        mainPresenter?.fetchKeyword()
    }
    
    @objc func goToFavoriteRecipe() {
        self.navigationController?.pushViewController(
            FavoriteViewController(),
            animated: true
        )
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
        self.view.endEditing(true)
        query = textField.text ?? ""
        mainPresenter?.fetchRecipe(q: query)
        mainPresenter?.fetchKeyword()
        return true
    }
    
    private func goToDetailRecipe(recipe: Recipe) {
        self.navigationController?.pushViewController(
            DetailRecipeViewController(recipe: recipe),
            animated: true
        )
    }
    
    func didUpdateKeyword(keywords: [String]) {
        self.keywords.removeAll()
        self.keywords = keywords
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        query = textField.text ?? ""
        mainPresenter?.fetchRecipe(q: query)
        mainPresenter?.fetchKeyword()
    }
}

extension MainViewController: UITableViewDataSource {
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
        cell.onClickItem = { self.goToDetailRecipe(recipe: recipe) }
        
        return cell
    }
}
