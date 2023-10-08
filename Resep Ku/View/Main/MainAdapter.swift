//
//  MainAdapter.swift
//  Resep Ku
//
//  Created by Anang Kurniawan on 08/10/23.
//

import Foundation

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
