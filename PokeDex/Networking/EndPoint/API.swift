//
//  API.swift
//  PokeDex
//
//  Created by Pedro Ramos on 17/10/19.
//  Copyright © 2019 Pedro Ramos. All rights reserved.
//

import Foundation
import Alamofire

public enum API {
    
}

extension API: EndPointType {
    
    private var environmentBaseURL: String {
        return "https://pokeapi.co/api/v2"
    }
    
    private var environmentBaseImageURL: String {
        return "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites"
    }
    
    var baseURL: URL {
        guard let url = URL(string: environmentBaseURL) else { fatalError("baseURL could not be configured.") }
        return url
    }
    
    var baseImageURL: URL {
        guard let url = URL(string: environmentBaseImageURL) else { fatalError("baseURL could not be configured.") }
        return url
    }
    
    var path: String {
        return ""
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var parameters: Parameters? {
        return nil
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
    
    
}
