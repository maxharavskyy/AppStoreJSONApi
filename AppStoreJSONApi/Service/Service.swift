//
//  Service.swift
//  AppStoreJSONApi
//
//  Created by Макс Гаравський on 15.04.2020.
//  Copyright © 2020 Макс Гаравський. All rights reserved.
//

import Foundation


class Service {
    
    static var shared = Service()
    
    func fetchSearch(searchTerm: String, completion: @escaping (SearchResult?, Error?) -> ()) {
        fetchGenericJSON(urlString: "https://itunes.apple.com/search?term=\(searchTerm)&entity=software", completion: completion)
        
        
        //        guard let url = URL(string: "https://itunes.apple.com/search?term=\(searchTerm)&entity=software") else { return }
                
//        URLSession.shared.dataTask(with: url, completionHandler: { data, responce, error in
//            if let error = error {
//                print("failed fetch data", error)
//                completion([], nil)
//            }
//
//            guard let data = data else { return  }
//
//            do {
//                let searchResult = try JSONDecoder().decode(SearchResult.self, from: data)
//                completion(searchResult.results, nil)
//            } catch {
//                print("Failed decode json")
//                completion([], nil)
//            }
//        }).resume()
    }
    
    func fetchGrossingGames(completion: @escaping (AppsGroup?, Error?) -> ()) {
        let urlString = "https://rss.itunes.apple.com/api/v1/us/ios-apps/top-grossing/all/25/explicit.json"
        fetchGenericJSON(urlString: urlString, completion: completion)
     }
    func fetchFree(completion: @escaping (AppsGroup?, Error?) -> ()) {
        let urlString = "https://rss.itunes.apple.com/api/v1/us/ios-apps/top-free/all/25/explicit.json"
        fetchGenericJSON(urlString: urlString, completion: completion)
    }
    func fetchPopular(completion: @escaping (AppsGroup?, Error?) -> ()) {
        fetchGenericJSON(urlString: "https://rss.itunes.apple.com/api/v1/us/ios-apps/new-apps-we-love/all/25/explicit.json", completion: completion)
    }
    func fetchTVShows(completion: @escaping (TVShows?, Error?) -> ()) {
        fetchGenericJSON(urlString: "https://rss.itunes.apple.com/api/v1/us/tv-shows/top-tv-episodes/all/10/explicit.json", completion: completion)
    }
    

//MARK:- Universal generic fetch method
    func fetchGenericJSON<T: Decodable>(urlString: String, completion: @escaping (T?, Error?) -> ()) {
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Error:",error)
            }
            guard let data = data else { return }
            do {
                let result = try JSONDecoder().decode(T.self, from: data)
                completion(result, nil)
            } catch {
                print("Failure decode:", error)
                completion(nil, error)
            }
        }.resume()
    }
    
    
}
