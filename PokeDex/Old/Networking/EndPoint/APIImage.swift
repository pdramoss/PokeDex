//
//  APIImage.swift
//  PokeDex
//
//  Created by Pedro Ramos on 23/10/19.
//  Copyright © 2019 Pedro Ramos. All rights reserved.
//

import Foundation

public enum APIImage {
    case frontDefault(Int)
    case frontShiny(Int)
    case frontFemale(Int)
    case frontShinyFemale(Int)
    case backDefault(Int)
    case backShiny(Int)
    case backFemale(Int)
    case backShinyFemale(Int)
}

extension APIImage: EndPointType {
    
    private var environmentBaseURL: String {
        return "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon"
    }
    
    var baseURL: URL {
        guard let url = URL(string: environmentBaseURL) else { fatalError("baseURL could not be configured.") }
        return url
    }
    
    var path: String {
        switch self {
        case .frontDefault(let id): return "/\(id).png"
        case .frontShiny(let id): return "/shiny/\(id).png"
        case .frontFemale(let id): return "/female/\(id).png"
        case .frontShinyFemale(let id): return "/shiny/female/\(id).png"
        case .backDefault(let id): return "/back/\(id).png"
        case .backShiny(let id): return "/back/shiny/\(id).png"
        case .backFemale(let id): return "/back/female/\(id).png"
        case .backShinyFemale(let id): return "/back/shiny/female/\(id).png"
        }
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var task: HTTPTask {
        return .request
    }
    
    var headers: HTTPHeaders? {
        return ["Content-Type": "application/json"]
    }
}

