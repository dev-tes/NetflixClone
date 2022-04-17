//
//  YoutubeSearchResponse.swift
//  NetflixClone
//
//  Created by Tes on 17/04/2022.
//

import Foundation

struct YoutubeSearchResponse: Codable {
    let items: [VideoElement]
    
}

struct VideoElement: Codable {
    let id: IdVideoElement
}

struct IdVideoElement: Codable {
    let kind: String
    let videoId: String
}
