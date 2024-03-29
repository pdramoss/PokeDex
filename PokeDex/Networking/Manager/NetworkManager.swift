//
//  NetworkManager.swift
//  PokeDex
//
//  Created by Pedro Ramos on 21/10/19.
//  Copyright © 2019 Pedro Ramos. All rights reserved.
//

import UIKit

public enum NetworkResponseError: String, Error {
    case authenticationError = "You need to be authenticated first."
    case badRequest = "Bad request"
    case outdated = "The url you requested is outdated."
    case failed = "Network request failed."
    case noData = "Response returned with no data to decode."
    case unableToDecode = "We could not decode the response."
    case notDecodeData = "Not decode data"
    case notParseData = "Not Parse Data"
}

protocol NetworkManagerProtocol {
    func getFrontDefaultImage(id: Int, completion: @escaping(Result<UIImage?, Error>) -> Void)
    func handleNetworkResponse(_ response: HTTPURLResponse) -> Result<Bool,NetworkResponseError>
}

struct NetworkManager: NetworkManagerProtocol {
    let router = Router<API>()
    let routerImage = Router<APIImage>()
    
    func load<T: Decodable> (data: Data?, as type: T.Type = T.self) throws -> T {
        guard let data = data else {
            throw NetworkResponseError.notDecodeData
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        } catch {
            throw NetworkResponseError.notParseData
        }
    }
    
    func getFrontDefaultImage(id: Int, completion: @escaping(Result<UIImage?, Error>) -> Void) {
        routerImage.request(.frontDefault(id)) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
            }
            
            if let response = response as? HTTPURLResponse {
                let result = self.handleNetworkResponse(response)
                switch result {
                case .success:
                    guard let data = data else {
                        completion(.failure(NetworkResponseError.noData))
                        return
                    }
                    let image = UIImage(data: data)
                    completion(.success(image))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
    }
    
    func handleNetworkResponse(_ response: HTTPURLResponse) -> Result<Bool, NetworkResponseError> {
        switch response.statusCode {
        case 200...299: return .success(true)
        case 401...499: return .failure(.authenticationError)
        case 500...599: return .failure(.badRequest)
        case 600...699: return .failure(.outdated)
        default: return .failure(.failed) }
    }
}
