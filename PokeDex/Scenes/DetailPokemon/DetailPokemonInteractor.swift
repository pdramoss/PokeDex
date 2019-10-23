//
//  DetailPokemonInteractor.swift
//  PokeDex
//
//  Created by Pedro Ramos on 23/10/19.
//  Copyright (c) 2019 Pedro Ramos. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol DetailPokemonBusinessLogic {
    func doSomething(request: DetailPokemonScene.Something.Request)
}

protocol DetailPokemonDataStore {
    //var name: String { get set }
}

class DetailPokemonInteractor: DetailPokemonBusinessLogic, DetailPokemonDataStore {
    var presenter: DetailPokemonPresentationLogic?
    var worker: DetailPokemonWorker?
    //var name: String = ""
    
    // MARK: Do something
    
    func doSomething(request: DetailPokemonScene.Something.Request) {
        worker = DetailPokemonWorker()
        worker?.doSomeWork()
        
        let response = DetailPokemonScene.Something.Response()
        presenter?.presentSomething(response: response)
    }
}