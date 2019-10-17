//
//  SearchResponse.swift
//  Spotify
//
//  Created by Mohsen Moghimi on 10/17/19.
//  Copyright © 2019 Mohsen Moghimi. All rights reserved.
//

import Foundation
struct SearchResponse : Codable {
    let tracks : Tracks?
    
    enum CodingKeys: String, CodingKey {
        
        case tracks = "tracks"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        tracks = try values.decodeIfPresent(Tracks.self, forKey: .tracks)
    }
    
}

