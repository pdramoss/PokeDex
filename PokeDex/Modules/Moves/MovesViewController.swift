//
//  MovesViewController.swift
//  PokeDex
//
//  Created by Pedro Ramos on 11/11/19.
//  Copyright (c) 2019 Pedro Ramos. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol MovesDisplayLogic: class {
    func displaySomething(viewModel: Moves.Something.ViewModel)
}

class MovesViewController: BaseViewController {
    var interactor: MovesBusinessLogic?
    var router: (NSObjectProtocol & MovesRoutingLogic & MovesDataPassing)?
    @IBOutlet private weak var tableView: UITableView!
    
    let searchController = UISearchController(searchResultsController: nil)
    
    // MARK: Setup
    
    private func setup() {
        let viewController = self
        let interactor = MovesInteractor()
        let presenter = MovesPresenter()
        let router = MovesRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
        setupSearchController()
        doSomething()
    }
    
    func setupSearchController() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    // MARK: Routing
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackgroundImage(image: UIImage(named: "background.gradient"))
        tableView.tableFooterView = UIView()
        setup()
    }
    
    // MARK: Do something
    
    //@IBOutlet weak var nameTextField: UITextField!
    
    func doSomething() {
        let request = Moves.Something.Request()
        interactor?.doSomething(request: request)
    }
}

extension MovesViewController: MovesDisplayLogic {
    func displaySomething(viewModel: Moves.Something.ViewModel) {
        //nameTextField.text = viewModel.name
    }
}

extension MovesViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        
    }
}
