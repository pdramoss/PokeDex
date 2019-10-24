//
//  DetailPokemonViewController.swift
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

protocol DetailPokemonDisplayLogic: class {
    func displayImage(viewModel: DetailPokemonScene.LoadImage.ViewModel)
    func displayInitialData(viewModel: DetailPokemonScene.Load.ViewModel)
    func displayMessageError(error: Error)
}

class DetailPokemonViewController: UIViewController {
    var id: Int = -1
    var name: String = String()
    var interactor: DetailPokemonBusinessLogic?
    var router: (NSObjectProtocol & DetailPokemonRoutingLogic & DetailPokemonDataPassing)?
    var model: PokemonResponse?
    
    // MARK: Object lifecycle
    
    private func setup() {
        let viewController = self
        let interactor = DetailPokemonInteractor()
        let presenter = DetailPokemonPresenter()
        let router = DetailPokemonRouter()
        let worker = DetailPokemonWorker()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        interactor.worker = worker
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = name.uppercased()
        setup()
        loadInitialData()
    }
    
    func loadInitialData() {
        interactor?.doLoadInitialData(request: DetailPokemonScene.Load.Request(id: self.id))
        interactor?.doLoadImageData(request: DetailPokemonScene.LoadImage.Request(id: self.id))
    }
}

extension DetailPokemonViewController: DetailPokemonDisplayLogic {
    func displayInitialData(viewModel: DetailPokemonScene.Load.ViewModel) {
        self.model = viewModel.pokemon
        DispatchQueue.main.async {
            self.view.backgroundColor = viewModel.pokemon.types.first?.pokemonType.color
        }
    }
    
    func displayImage(viewModel: DetailPokemonScene.LoadImage.ViewModel) {
        
    }
    
    func displayMessageError(error: Error) {
        
    }
}

extension DetailPokemonViewController {
    static var identifier: String {
        return "DetailPokemonViewController"
    }
}
