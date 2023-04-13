//
//  ImageManager.swift
//  MVVM
//
//  Created by Татьяна Аникина on 02.02.2022.
//

import Foundation

class ImageManager {
    
   static let shared = ImageManager()
    
    func getImageData(from urlToImage: String) -> Data? {
        guard let imageURL = URL(string: urlToImage) else { return nil }
        guard let imageData = try? Data(contentsOf: imageURL) else { return nil }
        return imageData
    }
}
