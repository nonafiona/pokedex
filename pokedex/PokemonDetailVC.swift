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
        
        // MARK: Update Name
        nameLabel.text = pokemon.name.capitalized
        
        // MARK: Update Pokemon Image
        let img = UIImage(named: "\(pokemon.pokedexId)")
        mainImage.image = img
        currentEvoImage.image = img
        
        // MARK: Update PokedexID
        pokedexLabel.text = "\(pokemon.pokedexId)"
        
        // MARK: Update data from Dictionary
        pokemon.downloadPokemonDetail {
            
            self.updateUI()
        }
        
    }
    
    // MARK: Update UIView
    
    func updateUI() {
        
        attackLabel.text = pokemon.attack
        defenseLabel.text = pokemon.defense
        weightLabel.text = pokemon.weight
        heightLabel.text = pokemon.height
        typeLabel.text = pokemon.type
        descriptionLabel.text = pokemon.description
        evoLabel.text = pokemon.nextEvolutionTxt
        
        // MARK: Handling Evolution text & images
        if pokemon.nextEvolutionId == "" {
            evoLabel.text = "No Evolutions"
            nextEvoImage.isHidden = true
            
        } else {
            nextEvoImage.isHidden = false
            nextEvoImage.image = UIImage(named: pokemon.nextEvolutionId)
            let str = "Next Evolution: \(pokemon.nextEvolutionName) - LVL \(pokemon.nextEvolutionLevel)"
            evoLabel.text = str
        }
        
    }
    
    // MARK: IBActions 
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
    }
    
}
