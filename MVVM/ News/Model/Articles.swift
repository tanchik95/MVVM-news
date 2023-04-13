//
//  Articles.swift
//  MVVM
//
//  Created by Татьяна Аникина on 31.01.2022.
//

import Foundation

struct Articles: Decodable {
    var source: Source
    var author: String?
    var title: String?
    var description: String?
    var url: String?
    var urlToImage: String?
    var publishedAt: String?
}
