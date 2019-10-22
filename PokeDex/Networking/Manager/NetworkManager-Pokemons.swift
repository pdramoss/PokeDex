//
//  NetworkManager-Pokemons.swift
//  PokeDex
//
//  Created by Pedro Ramos on 22/10/19.
//  Copyright © 2019 Pedro Ramos. All rights reserved.
//

import Foundation

extension NetworkManager {
    
    func getAllPokemon(offset: Int, limit: Int, completion: @escaping (Result<AllPokemon, Error>) -> Void) {
        router.request(.allPokemon(offset, limit)) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
            }
            if let response = response as? HTTPURLResponse {
                let result = self.handleNetworkResponse(response)
                switch result {
                case .success:
                    do {
                        let allPokemon: AllPokemon = try self.load(data: data)
                        completion(.success(allPokemon))
                    } catch {
                        completion (.failure(error))
                    }
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
    }
}
