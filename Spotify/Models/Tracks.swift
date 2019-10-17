//
//  Tracks.swift
//  Spotify
//
//  Created by Mohsen Moghimi on 10/17/19.
//  Copyright © 2019 Mohsen Moghimi. All rights reserved.
//

import Foundation

struct Tracks : Codable {
    let items : [Items]?
    let offset : Int?
    let href : String?
    let limit : Int?
    let total : Int?
    let next : String?
    let previous : String?
    
    enum CodingKeys: String, CodingKey {
        
        case items = "items"
        case offset = "offset"
        case href = "href"
        case limit = "limit"
        case total = "total"
        case next = "next"
        case previous = "previous"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        items = try values.decodeIfPresent([Items].self, forKey: .items)
        offset = try values.decodeIfPresent(Int.self, forKey: .offset)
        href = try values.decodeIfPresent(String.self, forKey: .href)
        limit = try values.decodeIfPresent(Int.self, forKey: .limit)
        total = try values.decodeIfPresent(Int.self, forKey: .total)
        next = try values.decodeIfPresent(String.self, forKey: .next)
        previous = try values.decodeIfPresent(String.self, forKey: .previous)
    }
    
}

