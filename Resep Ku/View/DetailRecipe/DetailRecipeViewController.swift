//
//  DetailRecipeViewController.swift
//  Resep Ku
//
//  Created by Anang Kurniawan on 11/08/23.
//

import UIKit

class DetailRecipeViewController: UIViewController, DetailRecipeView {
    
    @IBOutlet weak var imageThumbnail: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var iconYoutube: UIButton!
    @IBOutlet weak var iconWeb: UIButton!
    @IBOutlet weak var labelIngridients: UILabel!
    @IBOutlet weak var labelCategory: UILabel!
    @IBOutlet weak var labelRecipe: UILabel!
    @IBOutlet weak var labelTags: UILabel!
    @IBOutlet weak var buttonFavorite: UIButton!
    @IBOutlet weak var buttonDeleteFavorite: UIButton!
    
    private var recipe: Recipe? = nil
    private var presenter: DetailRecipePresenter? = nil
    
    init(
        recipe: Recipe
    ) {
        self.recipe = recipe
        super.init(nibName: "DetailRecipeViewController", bundle: Bundle.main)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter = DetailRecipePresenter(view: self)
        self.title = recipe?.strMeal ?? "Detail Recipe"
        self.labelTitle.text = recipe?.strMeal ?? "-"
        self.labelRecipe.text = recipe?.strInstructions ?? "-"
        self.labelCategory.text = recipe?.createDescription() ?? "-"
        self.labelIngridients.text = recipe?.createRecipients() ?? "-"
        self.labelTags.text = recipe?.strTags ?? "-"
        presenter?.fetchThumbnail(urlString: recipe?.strMealThumb ?? "")
        
        checkFavorite()
    }
    
    private func checkFavorite() {
        if (presenter?.isFavorite(recipeId: recipe?.idMeal ?? "") == true) {
            self.buttonFavorite.isHidden = true
            self.buttonDeleteFavorite.isHidden = false
        } else {
            self.buttonFavorite.isHidden = false
            self.buttonDeleteFavorite.isHidden = true
        }
    }
    
    func didFailWithError(error: Error?) {
        print(error ?? "-")
    }
    
    func didUpdateThumbnail(data: Data?) {
        DispatchQueue.main.async {
            if let safeData = data {
                self.imageThumbnail.image = UIImage(data: safeData)
            }
        }
    }

    @IBAction func openUrl(_ sender: Any) {
        let urlString = self.recipe?.strSource ?? ""
        let urlEncoded = urlString.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
        if let url = URL(string: urlEncoded), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
    
    @IBAction func openYoutube(_ sender: Any) {
        let urlString = self.recipe?.strYoutube ?? ""
        let urlEncoded = urlString.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
        if let url = URL(string: urlEncoded), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
    
    @IBAction func saveToFavorite(_ sender: Any) {
        if let safeRecipe = self.recipe {
            presenter?.insertRecipe(recipe: safeRecipe)
            checkFavorite()
            showToast(message: "Success save to favorite!")
        }
    }
    
    @IBAction func deleteFavorite(_ sender: Any) {
        if let recipeId = recipe?.idMeal {
            presenter?.deleteRecipe(recipeId: recipeId)
        }
        checkFavorite()
        showToast(message: "Success delete favorite!")
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
