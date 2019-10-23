//
//  PokemonTypeResponse.swift
//  PokeDex
//
//  Created by Pedro Ramos on 23/10/19.
//  Copyright © 2019 Pedro Ramos. All rights reserved.
//

import Foundation

struct PokemonTypeResponse: Codable {
    var slot: Int
    var type: BasicAPIResponse
}

extension PokemonTypeResponse {
    private enum CodingKeys: String, CodingKey {
        case slot = "slot"
        case type = "type"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        slot = try container.decode(Int.self, forKey: .slot)
        type = try container.decode(BasicAPIResponse.self, forKey: .type)
    }
}
