//
//  AppDependency.swift
//  Spotify
//
//  Created by Mohsen Moghimi on 10/17/19.
//  Copyright © 2019 Mohsen Moghimi. All rights reserved.
//

import Foundation

protocol ServiceType {}

protocol HasClientService: ServiceType {
    var client: APIClientType { get }
}

struct AppDependency: HasClientService {
    let client: APIClientType
    
    init() {
        client = APIClient()
    }
}

