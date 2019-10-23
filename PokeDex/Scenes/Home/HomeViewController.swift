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
    var filteredPokemons: [BasicAPIResponse] = []
    var isSearchBarEmpty: Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    var isFiltering: Bool {
        return searchController.isActive && !isSearchBarEmpty
    }
    
    let searchController = UISearchController(searchResultsController: nil)
    
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
        setupSearchController()
        loadInitialData()
    }
    
    func loadInitialData() {
        let request = HomeScene.Load.Request(offset: 0, limit: 2000)
        interactor?.doLoadInitialData(request: request)
    }
    
    func setupSearchController() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Pokemon..."
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    func filterContentForSearchText(_ searchText: String) {
        filteredPokemons = pokemons.filter({ $0.name.lowercased().contains(searchText.lowercased()) })
        tableView.reloadData()
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
        return isFiltering ? filteredPokemons.count : pokemons.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let pokemon = isFiltering ? filteredPokemons[indexPath.row] : pokemons[indexPath.row]
        let cell = UITableViewCell()
        cell.textLabel?.text = pokemon.name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let _ = isFiltering ? filteredPokemons[indexPath.row] : pokemons[indexPath.row]
    }
}

extension HomeViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        guard let text = searchBar.text else { return }
        filterContentForSearchText(text)
    }
}
