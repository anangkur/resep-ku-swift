//
//  ThumbnailManager.swift
//  Resep Ku
//
//  Created by Anang Kurniawan on 01/06/23.
//

import Foundation

protocol ThumbnailManagerDelegate {
    func didFailWithError(error: Error)
    func didUpdateThumbnail(data: Data)
}

struct ThumbnailManager {
    
    var delegate: ThumbnailManagerDelegate?
    
    func fetchThumbnail(urlString: String) {
        let url = URL(string: urlString)!
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            if (error != nil) {
                delegate?.didFailWithError(error: error!)
                return
            }
            
            if let safeData = data {
                delegate?.didUpdateThumbnail(data: safeData)
            }
        }
        task.resume()
    }
}
