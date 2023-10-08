//
//  RecipeCellPresenter.swift
//  Resep Ku
//
//  Created by Anang Kurniawan on 08/10/23.
//

import Foundation

class RecipeCellPresenter {
    
    private var view: RecipeCellView
    
    private var thumbnailManager: ThumbnailManager
    
    init(view: RecipeCellView) {
        self.view = view
        self.thumbnailManager = ThumbnailManager()
    }
    
    func fetchThumbnail(urlString: String) {
        thumbnailManager.fetchThumbnail(
            urlString: urlString,
            onSuccess: { (data: Data?) -> Void in
                self.view.didUpdateThumbnail(data: data)
            }, onFail: { (error: Error?) -> Void in
                self.view.didFailWithError(error: error)
            }
        )
    }
}
