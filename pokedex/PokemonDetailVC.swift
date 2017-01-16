//
//  PokemonDetailVC.swift
//  pokedex
//
//  Created by Fiona Carty on 1/15/17.
//  Copyright © 2017 Fiona Carty. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {
    
    // MARK: Instances
    var pokemon: Pokemon!
    
    // MARK: IBOutlets
    @IBOutlet weak var nameLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: Update View with Model Data
        nameLabel.text = pokemon.name
    }
}
