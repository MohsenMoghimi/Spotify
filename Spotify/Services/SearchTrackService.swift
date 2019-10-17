//
//  SearchTrackService.swift
//  Spotify
//
//  Created by Mohsen Moghimi on 10/17/19.
//  Copyright © 2019 Mohsen Moghimi. All rights reserved.
//

import RxSwift

protocol SearchServiceType {
    func performSearch(title: String, offset: Int) -> Single<SearchResponse>
}

struct SearchService: SearchServiceType {
    
    func performSearch(title: String, offset: Int) -> Single<SearchResponse> {
        return client.request(Router.searchTracks(title: title, offset: offset))
    }
    
    let client: APIClientType
    
    init(_ client: APIClientType) {
        self.client = client
    }
}

