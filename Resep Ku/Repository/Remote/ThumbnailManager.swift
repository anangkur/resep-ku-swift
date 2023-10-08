//
//  ThumbnailManager.swift
//  Resep Ku
//
//  Created by Anang Kurniawan on 01/06/23.
//

import Foundation

struct ThumbnailManager {
    
    func fetchThumbnail(
        urlString: String,
        onSuccess: @escaping (Data?) -> Void,
        onFail: @escaping (Error?) -> Void
    ) {
        let url = URL(string: urlString)!
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            if (error != nil) {
                onFail(error)
                return
            }
            
            if let safeData = data {
                onSuccess(safeData)
            }
        }
        task.resume()
    }
}
