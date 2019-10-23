//
//  HomeInteractor.swift
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

protocol HomeBusinessLogic {
    func doLoadInitialData(request: HomeScene.Load.Request)
}

protocol HomeDataStore {
    
}

class HomeInteractor: HomeBusinessLogic, HomeDataStore {
    var presenter: HomePresentationLogic?
    var worker: HomeWorkerProtocol?
    
    // MARK: Do something
    
    func doLoadInitialData(request: HomeScene.Load.Request) {
        worker?.fetchPokemons(offset: request.offset, limit: request.limit, completion: { [weak self] (response) in
            switch response {
            case .success(let pokemons):
                self?.presenter?.presentAllPokemons(response: HomeScene.Load.Response(pokemons: pokemons))
            case .failure(let error):
                self?.presenter?.presentMessageError(error: error)
            }
        })
    }
}
