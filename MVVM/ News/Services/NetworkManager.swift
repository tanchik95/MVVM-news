//
//  NetworkManager.swift
//  MVVM
//
//  Created by Татьяна Аникина on 31.01.2022.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private let newsURL = "https://newsapi.org/v2/top-headlines?language=ru&category=technology&sortBy=popularity&apiKey=cd551f3d39ee499cb3285a87046e7711"
    
    func fetchData(completion: @escaping (_ news: News) -> ()) {
        guard let url = URL(string: newsURL) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .useDefaultKeys
                let news = try decoder.decode(News.self, from: data)
                completion(news)
            } catch let error {
                print("Error serialization json", error)
            }
            
        }.resume()
    }
}
