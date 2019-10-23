//
//  HomeViewController.swift
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

protocol HomeDisplayLogic: class {
    var pokemons: [BasicAPIResponse] { get set }
    func displayInitialData(viewModel: HomeScene.Load.ViewModel)
    func displayMessageError(error: Error)
}

class HomeViewController: UITableViewController {
    var interactor: HomeBusinessLogic?
    var router: (NSObjectProtocol & HomeRoutingLogic & HomeDataPassing)?
    var pokemons: [BasicAPIResponse] = []
    
    // MARK: Setup
    
    private func setup() {
        let viewController = self
        let interactor = HomeInteractor()
        let presenter = HomePresenter()
        let router = HomeRouter()
        let worker = HomeWorker()
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
        setup()
        loadInitialData()
    }
    
    func loadInitialData() {
        let request = HomeScene.Load.Request(offset: 0, limit: 900)
        interactor?.doLoadInitialData(request: request)
    }
    
    
}

extension HomeViewController: HomeDisplayLogic {
    func displayInitialData(viewModel: HomeScene.Load.ViewModel) {
        self.pokemons = viewModel.pokemons
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func displayMessageError(error: Error) {
        
    }
}

extension HomeViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemons.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let pokemon = pokemons[indexPath.row]
        let cell = UITableViewCell()
        cell.textLabel?.text = pokemon.name
        return cell
    }
}
