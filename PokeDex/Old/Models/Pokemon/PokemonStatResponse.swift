//
//  PokemonStatResponse.swift
//  PokeDex
//
//  Created by Pedro Ramos on 23/10/19.
//  Copyright © 2019 Pedro Ramos. All rights reserved.
//

import Foundation

struct PokemonStatResponse: Codable {
    var baseStat: Int
    var effort: Int
    var stat: BasicAPIResponse
}

extension PokemonStatResponse {
    private enum CodingKeys: String, CodingKey {
        case baseStat = "base_stat"
        case effort = "effort"
        case stat = "stat"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        baseStat = try container.decode(Int.self, forKey: .baseStat)
        effort = try container.decode(Int.self, forKey: .effort)
        stat = try container.decode(BasicAPIResponse.self, forKey: .stat)
    }
}
