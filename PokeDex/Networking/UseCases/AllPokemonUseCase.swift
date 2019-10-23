//
//  AllPokemonUseCase.swift
//  PokeDex
//
//  Created by Pedro Ramos on 22/10/19.
//  Copyright © 2019 Pedro Ramos. All rights reserved.
//

import Foundation

struct AllPokemonResponse: Codable {
    var count: Int
    var next: String?
    var previous: String?
    var results: [SimplePokemonResponse]
}

struct SimplePokemonResponse: Codable {
    var name: String
    var url: String
}
