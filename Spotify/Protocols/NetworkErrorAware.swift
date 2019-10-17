//
//  NetworkErrorAware.swift
//  Spotify
//
//  Created by Mohsen Moghimi on 10/17/19.
//  Copyright © 2019 Mohsen Moghimi. All rights reserved.
//

import Foundation


protocol NetworkErrorAwareProtocol {
    func configure(mode: WaitingMode)
    func getMode() -> WaitingMode
}
enum WaitingMode {
    case retry
    case wait
}
