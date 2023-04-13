//
//  NewTableViewCellViewModel.swift
//  MVVM
//
//  Created by Татьяна Аникина on 10.02.2022.
//

import Foundation
import UIKit

class NewTableViewCellViewModel: NewsTableViewCellViewModelProtocol {
    
    private var new: Articles
    
    var author: String? {
        return new.author
    }
    
    var title: String? {
        return new.title
    }
    
    var imageData: Data? {
        return ImageManager.shared.getImageData(from: new.urlToImage ?? "")
    }
    
    var dateOfPublic: String? {
        return new.publishedAt
    }
    
    required init(new: Articles) {
        self.new = new
    }
}
