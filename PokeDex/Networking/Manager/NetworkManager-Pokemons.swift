//
//  NetworkManager-Pokemons.swift
//  PokeDex
//
//  Created by Pedro Ramos on 22/10/19.
//  Copyright © 2019 Pedro Ramos. All rights reserved.
//

import Foundation

protocol PokemonNetworkManagerProtocol {
    func getAllPokemons(offset: Int, limit: Int, completion: @escaping (Result<AllPokemonResponse, Error>) -> Void)
    func getPokemon(name: String, completion: @escaping(Result<PokemonResponse, Error>) -> Void)
}

extension NetworkManager: PokemonNetworkManagerProtocol {
    
    func getAllPokemons(offset: Int, limit: Int, completion: @escaping (Result<AllPokemonResponse, Error>) -> Void) {
        router.request(.allPokemon(offset, limit)) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
            }
            if let response = response as? HTTPURLResponse {
                let result = self.handleNetworkResponse(response)
                switch result {
                case .success:
                    do {
                        let allPokemon: AllPokemonResponse = try self.load(data: data)
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
    
    func getPokemon(name: String, completion: @escaping(Result<PokemonResponse, Error>) -> Void) {
        router.request(.pokemon(name)) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
            }
            
            if let response = response as? HTTPURLResponse {
                let result = self.handleNetworkResponse(response)
                switch result {
                case .success:
                    do {
                        let pokemon: PokemonResponse = try self.load(data: data)
                        completion(.success(pokemon))
                    } catch {
                        completion(.failure(error))
                    }
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
    }
}
