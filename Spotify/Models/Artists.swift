//
//  Artists.swift
//  Spotify
//
//  Created by Mohsen Moghimi on 10/17/19.
//  Copyright © 2019 Mohsen Moghimi. All rights reserved.
//

import Foundation

struct Artists : Codable {
    let name : String?
    let type : String?
    let id : String?
    
    enum CodingKeys: String, CodingKey {
        
        case name = "name"
        case type = "type"
        case id = "id"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        type = try values.decodeIfPresent(String.self, forKey: .type)
        id = try values.decodeIfPresent(String.self, forKey: .id)
    }
    
}

