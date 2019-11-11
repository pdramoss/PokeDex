//
//  Router.swift
//  PokeDex
//
//  Created by Pedro Ramos on 21/10/19.
//  Copyright © 2019 Pedro Ramos. All rights reserved.
//

import UIKit

class Router<EndPoint: EndPointType>: NetworkRouterProtocol {
    
    private let defaultSession = URLSession.shared
    private var dataTask: URLSessionTask?
    
    func request(_ route: EndPoint, completion: @escaping NetworkRouterCompletion) {
        let fullURL = route.baseURL.appendingPathComponent(route.path).absoluteString.removingPercentEncoding
        let url = URL(string: fullURL ?? String()) ?? route.baseURL.appendingPathComponent(route.path)
        var urlRequest = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 10.0)
        urlRequest.httpMethod = route.httpMethod.description
        urlRequest.allHTTPHeaderFields = route.headers
        
        do {
            urlRequest = try buildRequest(urlRequest, from: route)
        } catch {
            completion(nil, nil, error)
        }
        print("🤬 URL REQUEST: \(urlRequest)")
        dataTask = defaultSession.dataTask(with: urlRequest) { (data, response, error) in
            completion(data, response, error)
        }
        
        dataTask?.resume()
    }
    
    func cancel() {
        dataTask?.cancel()
    }
}
