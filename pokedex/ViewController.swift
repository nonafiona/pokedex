//
//  ViewController.swift
//  pokedex
//
//  Created by Fiona Carty on 1/7/17.
//  Copyright © 2017 Fiona Carty. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {

    // MARK: IBOutlets
    
    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    // MARK: Instances
    var pokemon = [Pokemon]()
    var filteredPokemon = [Pokemon]()
    var inSearchMode = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: CollectionView Setup
        collection.dataSource = self
        collection.delegate = self
        
        // MARK: Search Bar Setup
        searchBar.delegate = self
        searchBar.returnKeyType = UIReturnKeyType.done
        
        // MARK: Call Parser Setup
        parsePokemonCSV()

    }
    
    // MARK: Parser Method 
    func parsePokemonCSV() {
        
        // MARK: Path to CSV file
        let path = Bundle.main.path(forResource: "pokemon", ofType: "csv")!
        
        do {
            // MARK: Parse CSV
            let csv = try CSV(contentsOfURL: path)
            let rows = csv.rows
            print(rows)
            
            // MARK: Traverse inside CSV
            for row in rows {
                let pokeId = Int(row["id"]!)!
                let name = row["identifier"]!
                
                // MARK: Set to Pokemon object & append
                let poke = Pokemon(name: name, pokedexId: pokeId)
                pokemon.append(poke)
            }
            
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
    
    // MARK: CollectionView Methods
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // MARK: Create Cells
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokeCell", for: indexPath) as? PokeCell {
            
            // MARK: Dynamically Display Sprites
            let poke: Pokemon!
            
            if inSearchMode {
                
                poke = filteredPokemon[indexPath.row]
                cell.configureCell(poke)
            } else {
                
                poke = pokemon[indexPath.row]
                cell.configureCell(poke)
            }
            
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        // MARK: Select Cell to View Details
    
        var poke: Pokemon!
        
        // MARK: Handling Search Feature
        if inSearchMode {
            poke = filteredPokemon[indexPath.row]
        } else {
            poke = pokemon[indexPath.row]
        }
        
        // MARK: Segue to Detail View
        performSegue(withIdentifier: "PokemonDetailVC", sender: poke)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if inSearchMode {
            return filteredPokemon.count
        }
        return pokemon.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {

        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        // MARK: Define Size For Cell
        return CGSize(width: 105, height: 105)
        
    }
    
    // MARK: Search Bar Methods
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        // MARK: On return pressed
        view.endEditing(true) // hides keyboard...
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchBar.text == nil || searchBar.text == "" {
            
            // MARK: NOT inSearchMode Settings
            inSearchMode = false
            collection.reloadData()
            view.endEditing(true) // hides keyboard...
            
        } else {
            
            // MARK: Search Settings
            inSearchMode = true
            let lower = searchBar.text!.lowercased()
            
            // MARK: Search Filter
            filteredPokemon = pokemon.filter({$0.name.range(of: lower) != nil })
            collection.reloadData()
        }
        
    }
    
    // MARK: Segues 
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PokemonDetailVC" {
            if case let detailsVC = segue.destination as? PokemonDetailVC {
                if let poke = sender as? Pokemon {
                    detailsVC?.pokemon = poke
                }
            }
        }
    }
    
    
    
}

