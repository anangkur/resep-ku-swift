//
//  RecipeCell.swift
//  Resep Ku
//
//  Created by Anang Kurniawan on 01/06/23.
//

import UIKit

class RecipeCell: UITableViewCell, ThumbnailManagerDelegate {

    
    @IBOutlet weak var root: UIView!
    @IBOutlet weak var labelTags: UILabel!
    @IBOutlet weak var imageRecipe: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    
    var onClickItem: (() -> Void)? = nil
    private var thumbnailManager = ThumbnailManager()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        thumbnailManager.delegate = self
        root.setOnClickListener { self.onClickItem?() }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
    
    func didUpdateThumbnail(data: Data) {
        DispatchQueue.main.async {
            self.imageRecipe.image = UIImage(data: data)
        }
    }
    
    func fetchImage(urlString: String) {
        thumbnailManager.fetchThumbnail(urlString: urlString)
    }
    
    private func onItemClicked(sender : UITapGestureRecognizer) {
        onClickItem?()
    }
}
