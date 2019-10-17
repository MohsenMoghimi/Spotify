//
//  Router.swift
//  Spotify
//
//  Created by Mohsen Moghimi on 10/17/19.
//  Copyright © 2019 Mohsen Moghimi. All rights reserved.
//

import Foundation

enum Router {
    
    case getUserTopArtist
}

extension Router: URLRequestConvertible {
    var baseURL: URL {
        return URL(string: "https://api.spotify.com/")!
    }
    
    var path: String {
        switch self {
        case .getUserTopArtist:
            return "v1/me/top/artists"
        }
    }
    
    
    var method: HTTPMethod {
        switch self {
        default:
            return .get
        }
    }
    
    
    
    var parameters: [String : String] {
        switch self {
        default:
            return [:]
        }
    }
    
    var bodyData: Data? {
        return nil
    }
    
    func request() -> URLRequest {
        guard var components = URLComponents(url: baseURL.appendingPathComponent(path), resolvingAgainstBaseURL: false) else {
            fatalError("Unable to create URL components")
        }
        
        if !parameters.isEmpty {
            components.queryItems = parameters.map {
                URLQueryItem(name: String($0), value: String($1))
            }
        }
        
        guard let url = components.url else {
            fatalError("Could not get url")
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.httpBody = bodyData
        request.addValue("application/json", forHTTPHeaderField: "content-type")
        request.setValue("Bearer \(Constants.accessToken)", forHTTPHeaderField: "Authorization")
        
        return request
    }
}

