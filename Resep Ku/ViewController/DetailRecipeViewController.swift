//
//  DetailRecipeViewController.swift
//  Resep Ku
//
//  Created by Anang Kurniawan on 11/08/23.
//

import UIKit

class DetailRecipeViewController: UIViewController, ThumbnailManagerDelegate {
    
    @IBOutlet weak var desctiptionRecipe: UILabel!
    @IBOutlet weak var imageRecipe: UIImageView!
    @IBOutlet weak var titleRecipe: UILabel!
    
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
        self.titleRecipe.text = recipeResponse?.strMeal ?? "-"
        self.desctiptionRecipe.text = recipeResponse?.strInstructions ?? "-"
        thumbnailManager.fetchThumbnail(urlString: recipeResponse?.strMealThumb ?? "")
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
    
    func didUpdateThumbnail(data: Data) {
        DispatchQueue.main.async {
            self.imageRecipe.image = UIImage(data: data)
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
