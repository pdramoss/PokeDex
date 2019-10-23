//
//  DetailPokemonPresenter.swift
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

protocol DetailPokemonPresentationLogic {
    func presentSomething(response: DetailPokemonScene.Something.Response)
}

class DetailPokemonPresenter: DetailPokemonPresentationLogic {
    weak var viewController: DetailPokemonDisplayLogic?
    
    func presentSomething(response: DetailPokemonScene.Something.Response) {
        let viewModel = DetailPokemonScene.Something.ViewModel()
        viewController?.displaySomething(viewModel: viewModel)
    }
}
