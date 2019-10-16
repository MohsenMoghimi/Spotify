//
//  ViewModel.swift
//  Spotify
//
//  Created by Mohsen Moghimi on 10/17/19.
//  Copyright © 2019 Mohsen Moghimi. All rights reserved.
//

import Foundation

protocol ViewModelType {
    associatedtype Dependencies
    var dependencies: Dependencies { get }
}

class ViewModel<Services> : ViewModelType {
    typealias Dependencies = Services
    var dependencies: Dependencies
    
    init() {
        self.dependencies = AppDependency() as! Services
    }
}

