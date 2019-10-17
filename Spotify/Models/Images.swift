//
//  Images.swift
//  Spotify
//
//  Created by Mohsen Moghimi on 10/17/19.
//  Copyright © 2019 Mohsen Moghimi. All rights reserved.
//

import Foundation

struct Images : Codable {
    let height : Int?
    let url : String?
    let width : Int?
    
    enum CodingKeys: String, CodingKey {
        
        case height = "height"
        case url = "url"
        case width = "width"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        height = try values.decodeIfPresent(Int.self, forKey: .height)
        url = try values.decodeIfPresent(String.self, forKey: .url)
        width = try values.decodeIfPresent(Int.self, forKey: .width)
    }
    
}

