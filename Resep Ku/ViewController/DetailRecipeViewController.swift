//
//  DetailRecipeViewController.swift
//  Resep Ku
//
//  Created by Anang Kurniawan on 11/08/23.
//

import UIKit

class DetailRecipeViewController: UIViewController, ThumbnailManagerDelegate {
    
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
    
    private var recipeResponse: RecipeResponse? = nil
    private var thumbnailManager = ThumbnailManager()
    private let favoriteRepository = FavoriteRecipeRepositoryImpl.sharedInstance
    
    init(
        recipeResponse: RecipeResponse
    ) {
        self.recipeResponse = recipeResponse
        super.init(nibName: "DetailRecipeViewController", bundle: Bundle.main)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        thumbnailManager.delegate = self
        self.title = recipeResponse?.strMeal ?? "Detail Recipe"
        self.labelTitle.text = recipeResponse?.strMeal ?? "-"
        self.labelRecipe.text = recipeResponse?.strInstructions ?? "-"
        self.labelCategory.text = recipeResponse?.createDescription() ?? "-"
        self.labelIngridients.text = recipeResponse?.createRecipients() ?? "-"
        self.labelTags.text = recipeResponse?.strTags ?? ""
        thumbnailManager.fetchThumbnail(urlString: recipeResponse?.strMealThumb ?? "")
        
        checkFavorite()
    }
    
    private func checkFavorite() {
        let result: RecipeObject? = if let id = recipeResponse?.idMeal {
            favoriteRepository.loadRecipe(recipeId: id)
        } else {
            nil
        }
        if (result != nil) {
            self.buttonFavorite.isHidden = true
            self.buttonDeleteFavorite.isHidden = false
        } else {
            self.buttonFavorite.isHidden = false
            self.buttonDeleteFavorite.isHidden = true
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
    
    func didUpdateThumbnail(data: Data) {
        DispatchQueue.main.async {
            self.imageThumbnail.image = UIImage(data: data)
        }
    }

    @IBAction func openUrl(_ sender: Any) {
        let urlString = self.recipeResponse?.strSource ?? ""
        let urlEncoded = urlString.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
        if let url = URL(string: urlString), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
    
    @IBAction func openYoutube(_ sender: Any) {
        let urlString = self.recipeResponse?.strYoutube ?? ""
        let urlEncoded = urlString.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
        if let url = URL(string: urlString), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
    
    @IBAction func saveToFavorite(_ sender: Any) {
        if let recipeObject = recipeResponse?.toRecipeObject() {
            favoriteRepository.insertRecipe(recipe: recipeObject)
        }
        checkFavorite()
        showToast(message: "Success save to favorite!")
    }
    
    @IBAction func deleteFavorite(_ sender: Any) {
        if let recipeId = recipeResponse?.idMeal {
            favoriteRepository.deleteRecipe(recipeId: recipeId)
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
