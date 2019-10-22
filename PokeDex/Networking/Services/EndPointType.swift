//
//  EndPointType.swift
//  PokeDex
//
//  Created by Pedro Ramos on 17/10/19.
//  Copyright © 2019 Pedro Ramos. All rights reserved.
//

import Foundation

protocol EndPointType {
    var baseURL: URL { get }
    var baseImageURL: URL { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var task: HTTPTask { get }
    var headers: HTTPHeaders? { get }
}
