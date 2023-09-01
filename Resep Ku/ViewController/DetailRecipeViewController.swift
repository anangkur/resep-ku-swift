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
    
    private var recipeResponse: RecipeResponse? = nil
    private var thumbnailManager = ThumbnailManager()
    
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
        self.labelCategory.text = "\(recipeResponse?.strCategory ?? "") - \(recipeResponse?.strArea ?? "") - \(recipeResponse?.strTags ?? "")"
        self.labelIngridients.text = recipeResponse?.createRecipients() ?? "-"
        thumbnailManager.fetchThumbnail(urlString: recipeResponse?.strMealThumb ?? "")
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
        print(urlEncoded)
        if let url = URL(string: urlString), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
    
    
    @IBAction func openYoutube(_ sender: Any) {
        let urlString = self.recipeResponse?.strYoutube ?? ""
        let urlEncoded = urlString.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
        print(urlEncoded)
        if let url = URL(string: urlString), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
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
