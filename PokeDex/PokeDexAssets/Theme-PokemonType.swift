//
//  Theme.swift
//  PokeDex
//
//  Created by Pedro Ramos on 20/10/19.
//  Copyright © 2019 Pedro Ramos. All rights reserved.
//

import UIKit

public enum PokemonType: String, CaseIterable, CustomStringConvertible {
    
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
    
    public var description: String {
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
    
    public init(rawValue: String) {
        self = PokemonType.fromRaw(rawValue.lowercased())
    }
    
    static func fromRaw(_ rawValue: String) -> PokemonType {
        switch rawValue {
        case PokemonType.bug.description.lowercased(): return .bug
        case PokemonType.dark.description.lowercased(): return .dark
        case PokemonType.dragon.description.lowercased(): return .dragon
        case PokemonType.electric.description.lowercased(): return .electric
        case PokemonType.fairy.description.lowercased(): return .fairy
        case PokemonType.fight.description.lowercased(): return .fight
        case PokemonType.fire.description.lowercased(): return .fire
        case PokemonType.flying.description.lowercased(): return .flying
        case PokemonType.ghost.description.lowercased(): return .ghost
        case PokemonType.grass.description.lowercased(): return .grass
        case PokemonType.ground.description.lowercased(): return .ground
        case PokemonType.ice.description.lowercased(): return .ice
        case PokemonType.normal.description.lowercased(): return .normal
        case PokemonType.poison.description.lowercased(): return .poison
        case PokemonType.psychic.description.lowercased(): return .psychic
        case PokemonType.rock.description.lowercased(): return .rock
        case PokemonType.steel.description.lowercased(): return .steel
        case PokemonType.water.description.lowercased(): return .water
        default: return .bug
        }
    }
}
