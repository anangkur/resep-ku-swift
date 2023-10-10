//
//  FavoriteViewController.swift
//  Resep Ku
//
//  Created by Anang Kurniawan on 10/10/23.
//

import UIKit

class FavoriteViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, FavoriteView {

    @IBOutlet weak var recipeTable: UITableView!
    
    private var recipes: [Recipe] = []
    private var presenter: FavoritePresenter? = nil
    
    init() {
        super.init(nibName: "FavoriteViewController", bundle: Bundle.main)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        recipeTable.dataSource = self
        recipeTable.delegate = self
        presenter = FavoritePresenter(view: self)
        
        self.title = "Favorite"
        
        presenter?.fetchFavoriteRecipes()
    }
    
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return recipes.count
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        tableView.register(
            UINib(nibName: "RecipeCell", bundle: nil),
            forCellReuseIdentifier: "ReuseIdentifier"
        )
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "ReuseIdentifier",
            for: indexPath
        ) as! RecipeCell
        let recipe = recipes[indexPath.row]
        cell.labelTitle.text = recipe.strMeal ?? "-"
        cell.labelDescription.text = recipe.createDescription()
        cell.labelTags.text = recipe.strTags
        cell.fetchImage(urlString: recipe.strMealThumb ?? "")
        cell.onClickItem = {
            self.goToDetailRecipe(recipe: recipe)
        }
        return cell
    }
    
    func showError(error: Error?) {
        if let safeError = error {
            showToast(message: safeError.localizedDescription)
        }
    }
    
    func favoriteFetched(favoriteRecipes: [Recipe]) {
        recipes.removeAll()
        recipes = favoriteRecipes
        recipeTable.reloadData()
    }
    
    private func goToDetailRecipe(recipe: Recipe) {
        self.navigationController?.pushViewController(
            DetailRecipeViewController(recipe: recipe),
            animated: true
        )
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
