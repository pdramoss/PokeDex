//
//  HomeModels.swift
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

enum HomeScene {
    // MARK: Use cases
    
    enum Load {
        struct Request {
            var offset: Int
            var limit: Int
        }
        struct Response {
            var pokemons: [SimplePokemonResponse]
        }
        struct ViewModel {
            var pokemons: [SimplePokemonResponse]
        }
    }
}
