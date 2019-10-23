//
//  Int-Extension.swift
//  PokeDex
//
//  Created by Pedro Ramos on 23/10/19.
//  Copyright © 2019 Pedro Ramos. All rights reserved.
//

import Foundation

extension Int {
    func numberWithZeros(number: Int) -> String {
        return String(format: "%0\(number)d", self)
    }
}
