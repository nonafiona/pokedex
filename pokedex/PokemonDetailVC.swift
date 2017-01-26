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
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var defenseLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var pokedexLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var attackLabel: UILabel!
    @IBOutlet weak var currentEvoImage: UIImageView!
    @IBOutlet weak var nextEvoImage: UIImageView!
    @IBOutlet weak var evoLabel: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: Update View with Model Data
        nameLabel.text = pokemon.name
    }
}
