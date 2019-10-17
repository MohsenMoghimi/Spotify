//
//  Album.swift
//  Spotify
//
//  Created by Mohsen Moghimi on 10/17/19.
//  Copyright © 2019 Mohsen Moghimi. All rights reserved.
//

import Foundation

struct Album : Codable {
    let total_tracks : Int?
    let artists : [Artists]?
    let images : [Images]?
    let name : String?
    let uri : String?
    let id : String?
    let type : String?
    let album_type : String?
    
    enum CodingKeys: String, CodingKey {
        
        case total_tracks = "total_tracks"
        case artists = "artists"
        case images = "images"
        case name = "name"
        case uri = "uri"
        case id = "id"
        case type = "type"
        case album_type = "album_type"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        total_tracks = try values.decodeIfPresent(Int.self, forKey: .total_tracks)
        artists = try values.decodeIfPresent([Artists].self, forKey: .artists)
        images = try values.decodeIfPresent([Images].self, forKey: .images)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        uri = try values.decodeIfPresent(String.self, forKey: .uri)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        type = try values.decodeIfPresent(String.self, forKey: .type)
        album_type = try values.decodeIfPresent(String.self, forKey: .album_type)
    }
    
}

