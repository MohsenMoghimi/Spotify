//
//  APIClient.swift
//  Spotify
//
//  Created by Mohsen Moghimi on 10/17/19.
//  Copyright © 2019 Mohsen Moghimi. All rights reserved.
//

import Foundation
import RxSwift

enum APIError: Error {
    
    case NotFound
    case NotAuthorized
    
}

protocol APIClientType {
    func request<M: Codable>(_ endpoint: URLRequestConvertible) -> Single<M>
}

final class APIClient: NSObject, URLSessionDelegate, APIClientType {
    
    var session: URLSession!
    
    override init() {
        super.init()
        
        let urlsession = URLSession(configuration: .default, delegate: self, delegateQueue: OperationQueue.main)
        urlsession.configuration.allowsCellularAccess = true
        urlsession.configuration.timeoutIntervalForRequest = TimeInterval(10.0)
        
        self.session = urlsession
    }
    
    func request<M: Codable>(_ endpoint: URLRequestConvertible) -> Single<M> {
        return Single<M>.create { [unowned self] single in
            
            let request = endpoint.request()
            
            #if DEBUG
            print("REQUEST: \(debugPrint(request))")
            #endif
            
            let task = self.session.dataTask(with: request) { (data, response, error) in
                if let responseError = error {
                    single(.error(responseError))
                }
                
                #if DEBUG
                print("RESPONSE: \(debugPrint(response ?? "NULL"))")
                #endif
                
                if let httpResponse = response as? HTTPURLResponse {
                    switch httpResponse.statusCode {
                    case 200:
                        guard let data = data else {
                            break
                        }
                        
                        do {
                            let model = try JSONDecoder().decode(M.self, from: data)
                            single(.success(model))
                        } catch let myJSONError {
                            single(.error(myJSONError))
                        }
                        
                    case 404:
                        single(.error(APIError.NotFound))
                        
                    default:
                        break
                    }
                }
            }
            
            task.resume()
            
            return Disposables.create {
                task.cancel()
            }
        }
    }
}
