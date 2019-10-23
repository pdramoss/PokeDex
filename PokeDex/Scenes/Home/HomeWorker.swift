//
//  HomeWorker.swift
//  PokeDex
//
//  Created by Pedro Ramos on 22/10/19.
//  Copyright (c) 2019 Pedro Ramos. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol HomeWorkerProtocol: class {
    func fetchPokemons(offset: Int, limit: Int, completion: @escaping(Result<[SimplePokemonResponse], Error>) -> Void)
}

class HomeWorker: HomeWorkerProtocol {
    var networkManager = NetworkManager()
    
    func fetchPokemons(offset: Int, limit: Int, completion: @escaping(Result<[SimplePokemonResponse], Error>) -> Void) {
        networkManager.getAllPokemons(offset: offset, limit: limit) { (response) in
            switch response {
            case .success(let all):
                completion(.success(all.results))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
