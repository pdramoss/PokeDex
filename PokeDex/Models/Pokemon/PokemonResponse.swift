//
//  PokemonResponse.swift
//  PokeDex
//
//  Created by Pedro Ramos on 22/10/19.
//  Copyright © 2019 Pedro Ramos. All rights reserved.
//

import Foundation

struct PokemonResponse: Codable {
    var id: Int
    var name: String
    var baseExperience: Int
    var height: Int
    var isDefault: Bool
    var order: Int
    var weight: Int
    var locationAreaEncounters: String
    var types: [PokemonTypeResponse]
    var stats: [PokemonStatResponse]
}

extension PokemonResponse {
    private enum CodingKeys: String, CodingKey{
        case id = "id"
        case name = "name"
        case baseExperience = "base_experience"
        case height = "height"
        case isDefault = "is_default"
        case order = "order"
        case weight = "weight"
        case locationAreaEncounters = "location_area_encounters"
        case types = "types"
        case stats = "stats"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        baseExperience = try container.decode(Int.self, forKey: .baseExperience)
        height = try container.decode(Int.self, forKey: .height)
        isDefault = try container.decode(Bool.self, forKey: .isDefault)
        order = try container.decode(Int.self, forKey: .order)
        weight = try container.decode(Int.self, forKey: .weight)
        locationAreaEncounters = try container.decode(String.self, forKey: .locationAreaEncounters)
        types = try container.decode([PokemonTypeResponse].self, forKey: .types)
        stats = try container.decode([PokemonStatResponse].self, forKey: .stats)
    }
}
