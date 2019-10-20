//
//  Theme.swift
//  PokeDex
//
//  Created by Pedro Ramos on 20/10/19.
//  Copyright © 2019 Pedro Ramos. All rights reserved.
//

import UIKit

public enum Theme {
    enum PokemonType: String, CaseIterable, CustomStringConvertible {
        case bug = "Bug"
        case dark = "Dark"
        case dragon = "Dragon"
        case electric = "Electric"
        case fairy = "Fairy"
        case fight = "Fight"
        case fire = "Fire"
        case flying = "Flying"
        case ghost = "Ghost"
        case grass = "Grass"
        case ground = "Ground"
        case ice = "Ice"
        case normal = "Normal"
        case poison = "Poison"
        case psychic = "Psychic"
        case rock = "Rock"
        case steel = "Steel"
        case water = "Water"
        
        var description: String {
            return self.rawValue.lowercased()
        }
        
        private var stringColor: String {
            return "\(self.rawValue) Color"
        }
        
        private var stringTagImage: String {
            return "\(self.description).tag"
        }
        
        private var stringTypeImage: String {
            return "\(self.description).type"
        }
        
        var color: UIColor? {
            return UIColor(named: self.stringColor)
        }
        
        var tagImage: UIImage? {
            return UIImage(named: self.stringTagImage)
        }
        
        var typeImage: UIImage? {
            return UIImage(named: self.stringTypeImage)
        }
    }
}
