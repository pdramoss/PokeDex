//
//  Router.swift
//  PokeDex
//
//  Created by Pedro Ramos on 21/10/19.
//  Copyright © 2019 Pedro Ramos. All rights reserved.
//

import Foundation

public typealias NetworkRouterCompletion = (_ data: Data?,_ response: URLResponse?,_ error: Error?)->()

protocol NetworkRouterProtocol: class {
    associatedtype EndPoint: EndPointType
    func request(_ route: EndPoint, completion: @escaping NetworkRouterCompletion)
    func cancel()
}

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
        
        dataTask = defaultSession.dataTask(with: urlRequest) { (data, response, error) in
            completion(data, response, error)
        }
        
        dataTask?.resume()
    }
    
    func cancel() {
        dataTask?.cancel()
    }
    
    fileprivate func buildRequest(_ request: URLRequest, from route: EndPoint) throws -> URLRequest {
        var request = request
        do {
            switch route.task {
            case .request:
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                
            case .requestParameters(let bodyParameters, let bodyEncoding,let urlParameters):
                try self.configureParameters(bodyParameters: bodyParameters, bodyEncoding: bodyEncoding, urlParameters: urlParameters, request: &request)
                
            case .requestParametersAndHeaders(let bodyParameters, let bodyEncoding, let urlParameters, let additionalHeaders):
                self.addAdditionalHeaders(additionalHeaders, request: &request)
                try self.configureParameters(bodyParameters: bodyParameters, bodyEncoding: bodyEncoding, urlParameters: urlParameters, request: &request)
            }
            return request
        } catch {
            throw error
        }
    }
    
    fileprivate func configureParameters(bodyParameters: Parameters?, bodyEncoding: ParameterEncoding, urlParameters: Parameters?, request: inout URLRequest) throws {
        do {
            try bodyEncoding.encode(urlRequest: &request, bodyParameters: bodyParameters, urlParameters: urlParameters)
        } catch {
            throw error
        }
    }
    
    fileprivate func addAdditionalHeaders(_ additionalHeaders: HTTPHeaders?, request: inout URLRequest) {
        guard let headers = additionalHeaders else { return }
        for (key, value) in headers {
            request.setValue(value, forHTTPHeaderField: key)
        }
    }
}
