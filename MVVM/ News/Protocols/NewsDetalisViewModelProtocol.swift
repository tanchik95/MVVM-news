//
//  NewsDetalisViewModelProtocol.swift
//  MVVM
//
//  Created by Татьяна Аникина on 31.01.2022.
//

import Foundation

protocol NewsDetalisViewModelProtocol {
    var title: String? { get }
    var description: String? { get }
    var imageData: Data? { get }
    var dateOfPublic: String? { get }
    var author: String? { get }
    init(new: Articles)
}
