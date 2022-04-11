//
//  Movie.swift
//  NetflixClone
//
//  Created by Tes on 12/03/2022.
//

import Foundation

struct TrendingTitlesResponse: Codable {
    let results: [Title]
}

struct Title: Codable  {
    let id: Int
    let mediaType: String?
    let originalName: String?
    let originalTitle: String?
    let posterPath: String?
    let overview: String?
    let voteCount: Int
    let releaseDate: String?
    let voteAverage: Double
    
    enum CodingKeys: String, CodingKey {
        case id, overview
        case mediaType = "media_type"
        case originalName = "original_name"
        case originalTitle = "original_title"
        case posterPath = "poster_path"
        case voteCount = "vote_count"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
    }
}
