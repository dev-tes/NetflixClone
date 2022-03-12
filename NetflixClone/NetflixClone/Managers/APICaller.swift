//
//  APICaller.swift
//  NetflixClone
//
//  Created by Tes on 12/03/2022.
//

import Foundation

struct Constants{
    static let apiKey = "ac7c844bf97f077b1e7820a068d19fd4"
    static let baseUrl = "https://api.themoviedb.org"
}

class APICaller {
    static let shared = APICaller()
    
    func getTrendingMovies(completion: @escaping(String) -> Void){
        guard let url = URL(string: "\(Constants.baseUrl)/3/trending/all/day?api_key=\(Constants.apiKey)") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {return}
            
            do{
                let results = try JSONDecoder().decode(TrendingMovieResponse.self, from: data)
                print(results.results[0].original_title)
            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
}
