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

enum APIError: Error {
    case failedToGetData
}

class APICaller {
    static let shared = APICaller()
    
    func getTrendingMovies(completion: @escaping(Result<[Movie], Error>) -> Void){
        guard let url = URL(string: "\(Constants.baseUrl)/3/trending/movie/day?api_key=\(Constants.apiKey)") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {return}
            
            do{
                let results = try JSONDecoder().decode(TrendingMovieResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    func getTrendingTvs (completion: @escaping(Result<[Tv], Error>) -> Void){
        guard let url = URL(string: "\(Constants.baseUrl)/3/trending/tv/day?api_key=\(Constants.apiKey)") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {return}
            
            do{
                let results = try JSONDecoder().decode(TrendingTvResponse.self, from: data)
//                completion(.success(results.results))
                print(results)
            } catch {
                print(error.localizedDescription)
//                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    func getUpcomingMovies(completion: @escaping(Result<[String], Error>) -> Void){
        guard let url = URL(string: "\(Constants.baseUrl)/3/movie/upcoming?api_key=\(Constants.apiKey)&language=en-US&page=1") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {return}
            
            do{
                let results = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
//                completion(.success(results.results))
                print(results)
            } catch {
                print(error.localizedDescription)
//                completion(.failure(error))
            }
        }
        task.resume()
    }
}
