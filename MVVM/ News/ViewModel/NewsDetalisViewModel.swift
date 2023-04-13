//
//  NewsDetalisViewModel.swift
//  MVVM
//
//  Created by Татьяна Аникина on 10.02.2022.
//

import Foundation

class NewsDetalisViewModel: NewsDetalisViewModelProtocol {
    
    private var new: Articles
    
    required init(new: Articles) {
        self.new = new
    }
    
    var title: String? {
        return new.title
    }
    
    var description: String? {
        return new.description
    }
    
    var imageData: Data? {
        return ImageManager.shared.getImageData(from: new.urlToImage ?? "")
    }
    
    var dateOfPublic: String? {
        return new.publishedAt
    }
    
    var author: String? {
        return new.author
    }
}
