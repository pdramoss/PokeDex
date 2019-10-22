//
//  AllPokemonUseCase.swift
//  PokeDex
//
//  Created by Pedro Ramos on 22/10/19.
//  Copyright © 2019 Pedro Ramos. All rights reserved.
//

import Foundation

struct AllPokemon: Codable {
    var count: Int
    var next: String?
    var previous: String?
    var results: [SimplePokemon]
}

struct SimplePokemon: Codable {
    var name: String
    var url: String
}
