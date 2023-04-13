//
//  NewsTableViewControllerViewModelProtocol.swift
//  MVVM
//
//  Created by Татьяна Аникина on 31.01.2022.
//

import Foundation

protocol NewsTableViewControllerViewModelProtocol {
    var news: [Articles] { get }
    
    func getNews(completion: @escaping() -> Void)
    func numberOfRows() -> Int
    func cellViewModel(for indexPath: IndexPath) -> NewsTableViewCellViewModelProtocol?
    func selectedRow(for indexPath: IndexPath)
    func viewModelForSelectedRow() -> NewsDetalisViewModelProtocol?
}
