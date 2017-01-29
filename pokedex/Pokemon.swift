//
//  Pokemon.swift
//  pokedex
//
//  Created by Fiona Carty on 1/9/17.
//  Copyright © 2017 Fiona Carty. All rights reserved.
//

import Foundation
import Alamofire

class Pokemon {
    
    // MARK: Properties 
    
    private var _name: String!
    private var _pokedexId: Int!
    private var _description: String!
    private var _type: String!
    private var _defense: String!
    private var _height: String!
    private var _weight: String!
    private var _attack: String!
    private var _nextEvolutionTxt: String!
    private var _pokemonURL: String!
    
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
        
        self._pokemonURL = "\(URL_BASE)\(URL_POKEMON)\(self._pokedexId)/"
        
    }
    
    // MARK: Download Pokemon Details
    
    func downloadPokemonDetail(completed: DownloadComplete) {
        
        Alamofire.request(_pokemonURL).responseJSON { (response) in
            
            
            print(response.result.value)
        }
        
    }
    
    
}
