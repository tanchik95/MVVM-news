//
//  NewsTableViewCellViewModelProtocol.swift
//  MVVM
//
//  Created by Татьяна Аникина on 31.01.2022.
//

import Foundation

protocol NewsTableViewCellViewModelProtocol {
    var title: String? { get }
    var author: String? { get }
    var imageData: Data? { get }
    var dateOfPublic: String? { get }
    init(new: Articles)
}
