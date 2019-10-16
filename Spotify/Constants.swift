//
//  Constants.swift
//  Spotify
//
//  Created by Mohsen Moghimi on 10/16/19.
//  Copyright © 2019 Mohsen Moghimi. All rights reserved.
//

import Foundation
import SpotifyLogin


struct Constants {
    static let clientID = "ba05b9cd59634cefa8493ac961d76ed6"
    static let secretID = "80b7235a88264654a105a989f6775a59"
    static let redirectURI = URL(string: "dpg://mydigipay/")
    static var accessToken : String {
        if let token = UserDefaults.standard.value(forKey: "accessToken") as? String {
            return token
        } else {
            return ""
        }
    }
}
