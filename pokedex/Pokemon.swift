//
//  Pokemon.swift
//  pokedex
//
//  Created by Fiona Carty on 1/9/17.
//  Copyright © 2017 Fiona Carty. All rights reserved.
//

import Foundation

class Pokemon {
    
    // MARK: Properties 
    
    private var _name: String!
    private var _pokedexId: Int!
    
    // MARK: Data Encapsulation 
    
    var name: String {
        
        return _name
    }
    
    var pokedexId: Int {
        
        return _pokedexId
    }
    
    // MARK: Initializers 
    
    init(name: String, pokedexId: Int) {
        self._name = name
        self._pokedexId = pokedexId
    }
    
    
}
