//
//  PlayListViewModel.swift
//  Spotify
//
//  Created by Mohsen Moghimi on 10/17/19.
//  Copyright © 2019 Mohsen Moghimi. All rights reserved.
//

import Foundation
import RxSwift

final class PlayListViewModel: ViewModel<HasSearchService> {
    
    var searchResult : Observable<SearchResponse> = .never()
    
    let title : String
    let offset : Int
    
    init(title: String, offset: Int) {
        self.title = title
        self.offset = offset
        super.init()
        
        searchResult = dependencies.searchResulet.performSearch(title: title, offset: offset+20).asObservable()
    }
}
