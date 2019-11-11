//
//  ItemsPresenter.swift
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

protocol ItemsPresentationLogic {
    func presentSomething(response: Items.Something.Response)
}

class ItemsPresenter: ItemsPresentationLogic {
    weak var viewController: ItemsDisplayLogic?
    
    // MARK: Do something
    
    func presentSomething(response: Items.Something.Response) {
        let viewModel = Items.Something.ViewModel()
        viewController?.displaySomething(viewModel: viewModel)
    }
}
