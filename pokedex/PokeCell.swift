//
//  PokeCell.swift
//  pokedex
//
//  Created by Fiona Carty on 1/10/17.
//  Copyright © 2017 Fiona Carty. All rights reserved.
//

import UIKit

class PokeCell: UICollectionViewCell {
    
    // MARK: IBOutlets
    @IBOutlet weak var thumbImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    // MARK: Instances 
    var pokemon: Pokemon!
    
    // MARK: Configure Cell 
    func configureCell(pokemon: Pokemon) {
        
        self.pokemon = pokemon
        
        // MARK: Update View 
        nameLabel.text = self.pokemon.name.capitalized
        thumbImage.image = UIImage(named: "\(self.pokemon.pokedexId)")
        
    }
}
