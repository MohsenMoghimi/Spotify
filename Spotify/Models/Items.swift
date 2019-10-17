//
//  Items.swift
//  Spotify
//
//  Created by Mohsen Moghimi on 10/17/19.
//  Copyright © 2019 Mohsen Moghimi. All rights reserved.
//

import Foundation

struct Items : Codable {
    let name : String?
    let type : String?
    let preview_url : String?
    let popularity : Int?
    let explicit : Bool?
    let is_local : Bool?
    let uri : String?
    let album : Album?
    let artists : [Artists]?
    let id : String?
    let track_number : Int?
    
    enum CodingKeys: String, CodingKey {
        
        case name = "name"
        case type = "type"
        case preview_url = "preview_url"
        case popularity = "popularity"
        case explicit = "explicit"
        case is_local = "is_local"
        case uri = "uri"
        case album = "album"
        case artists = "artists"
        case id = "id"
        case track_number = "track_number"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        type = try values.decodeIfPresent(String.self, forKey: .type)
        preview_url = try values.decodeIfPresent(String.self, forKey: .preview_url)
        popularity = try values.decodeIfPresent(Int.self, forKey: .popularity)
        explicit = try values.decodeIfPresent(Bool.self, forKey: .explicit)
        is_local = try values.decodeIfPresent(Bool.self, forKey: .is_local)
        uri = try values.decodeIfPresent(String.self, forKey: .uri)
        album = try values.decodeIfPresent(Album.self, forKey: .album)
        artists = try values.decodeIfPresent([Artists].self, forKey: .artists)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        track_number = try values.decodeIfPresent(Int.self, forKey: .track_number)
    }
    
}
