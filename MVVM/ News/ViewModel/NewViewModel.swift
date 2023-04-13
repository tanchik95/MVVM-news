//
//  MainViewModel.swift
//  MVVM
//
//  Created by Татьяна Аникина on 07.09.2021.
//

import Foundation

class NewViewModel: NewsTableViewControllerViewModelProtocol {
    
    var news: [Articles] = []
    var indexPath: IndexPath?
    
    
    func viewModelForSelectedRow() -> NewsDetalisViewModelProtocol? {
        guard let indexRath = indexPath else { return nil }
        let new = news[indexRath.row]
        return NewsDetalisViewModel(new: new)
    }

    
    func getNews(completion: @escaping () -> Void) {
        NetworkManager.shared.fetchData { news in
            self.news = news.articles
            completion()
        }
    }
    
    func numberOfRows() -> Int {
        return news.count
    }
    
    func cellViewModel(for indexPath: IndexPath) -> NewsTableViewCellViewModelProtocol? {
        let new = news[indexPath.row]
        return NewTableViewCellViewModel(new: new)
    }
    
    func selectedRow(for indexPath: IndexPath) {
        self.indexPath = indexPath
    }
}
