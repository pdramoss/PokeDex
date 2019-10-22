//
//  NetworkManager.swift
//  PokeDex
//
//  Created by Pedro Ramos on 21/10/19.
//  Copyright © 2019 Pedro Ramos. All rights reserved.
//

import Foundation

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
    func handleNetworkResponse(_ response: HTTPURLResponse) -> Result<Bool,NetworkResponseError>
}

struct NetworkManager: NetworkManagerProtocol {
    let router = Router<API>()
    
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
    
    func handleNetworkResponse(_ response: HTTPURLResponse) -> Result<Bool, NetworkResponseError> {
        switch response.statusCode {
        case 200...299: return .success(true)
        case 401...499: return .failure(.authenticationError)
        case 500...599: return .failure(.badRequest)
        case 600...699: return .failure(.outdated)
        default: return .failure(.failed) }
    }
}
