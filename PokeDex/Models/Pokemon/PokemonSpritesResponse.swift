//
//  PokemonSpritesResponse.swift
//  PokeDex
//
//  Created by Pedro Ramos on 23/10/19.
//  Copyright © 2019 Pedro Ramos. All rights reserved.
//

import Foundation

struct PokemonSpritesResponse: Codable {
    var frontDefault: String?
    var frontShiny: String?
    var frontFemale: String?
    var frontShinyFemale: String?
    var backDefault: String?
    var backShiny: String?
    var backFemale: String?
    var backShinyFemale: String?
}

extension PokemonSpritesResponse {
    private enum CodingKeys: String, CodingKey{
        case frontDefault = "front_default"
        case frontShiny = "front_shiny"
        case frontFemale = "front_female"
        case frontShinyFemale = "front_shiny_female"
        case backDefault = "back_default"
        case backShiny = "back_shiny"
        case backFemale = "back_female"
        case backShinyFemale = "back_shiny_female"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        frontDefault = try container.decode(String.self, forKey: .frontDefault)
        frontShiny = try container.decode(String.self, forKey: .frontShiny)
        frontFemale = try container.decode(String.self, forKey: .frontFemale)
        frontShinyFemale = try container.decode(String.self, forKey: .frontShinyFemale)
        backDefault = try container.decode(String.self, forKey: .backDefault)
        backShiny = try container.decode(String.self, forKey: .backShiny)
        backFemale = try container.decode(String.self, forKey: .backFemale)
        backShinyFemale = try container.decode(String.self, forKey: .backShinyFemale)
    }
}
