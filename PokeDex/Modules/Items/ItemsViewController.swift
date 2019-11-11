//
//  ItemsViewController.swift
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

protocol ItemsDisplayLogic: class {
    func displaySomething(viewModel: Items.Something.ViewModel)
}

class ItemsViewController: BaseViewController, ItemsDisplayLogic {
    var interactor: ItemsBusinessLogic?
    var router: (NSObjectProtocol & ItemsRoutingLogic & ItemsDataPassing)?
    
    // MARK: Setup
    
    private func setup() {
        let viewController = self
        let interactor = ItemsInteractor()
        let presenter = ItemsPresenter()
        let router = ItemsRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
        doSomething()
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
        setup()
    }
    
    // MARK: Do something
    
    //@IBOutlet weak var nameTextField: UITextField!
    
    func doSomething() {
        let request = Items.Something.Request()
        interactor?.doSomething(request: request)
    }
    
    func displaySomething(viewModel: Items.Something.ViewModel) {
        //nameTextField.text = viewModel.name
    }
}