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

protocol HasSearchService: ServiceType {
    var searchResulet: SearchServiceType { get }
}

struct AppDependency: HasClientService, HasSearchService {
    
    let client: APIClientType
    let searchResulet: SearchServiceType
    
    init() {
        client = APIClient()
        searchResulet = SearchService(client)
    }
}

