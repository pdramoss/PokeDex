//
//  BasicResponse.swift
//  PokeDex
//
//  Created by Pedro Ramos on 22/10/19.
//  Copyright © 2019 Pedro Ramos. All rights reserved.
//

import Foundation

struct BasicAPIResponse: Codable {
    var name: String
    var url: String
}

extension BasicAPIResponse {
    private enum CodingKeys: String, CodingKey {
        case name = "name"
        case url = "url"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        url = try container.decode(String.self, forKey: .url)
    }
    
    var id: Int {
        let split = url.split(separator: "/")
        guard let last = split.last else { return -1 }
        let text = String(last)
        return Int(text) ?? -1
    }
    
}
