//
//  RecipeCellView.swift
//  Resep Ku
//
//  Created by Anang Kurniawan on 08/10/23.
//

import Foundation

protocol RecipeCellView {
    func didFailWithError(error: Error?)
    func didUpdateThumbnail(data: Data?)
}
