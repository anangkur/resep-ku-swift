//
//  RecipeCell.swift
//  Resep Ku
//
//  Created by Anang Kurniawan on 01/06/23.
//

import UIKit

class RecipeCell: UITableViewCell {

    @IBOutlet weak var ivRecipe: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelCategory: UILabel!
    @IBOutlet weak var labeltag: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
