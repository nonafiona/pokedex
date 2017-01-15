//
//  ViewController.swift
//  pokedex
//
//  Created by Fiona Carty on 1/7/17.
//  Copyright © 2017 Fiona Carty. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    // MARK: IBOutlets
    
    @IBOutlet weak var collection: UICollectionView!
    
    // MARK: Instances
    var pokemon = [Pokemon]()
    var musicPlayer: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: CollectionView Setup
        
        collection.dataSource = self
        collection.delegate = self
        
        // MARK: Parser Setup
        parsePokemonCSV()
        
    }
    
    // MARK: Initialize Audio
    func initAudio() {
        
    }
    
    // MARK: Parser Method 
    func parsePokemonCSV() {
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
            let poke = pokemon[indexPath.row]
            cell.configureCell(poke)
            
            return cell
        } else {
            
            return UICollectionViewCell()
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        // MARK: OnTap Cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
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
    
    // MARK: IBActions
    
    @IBAction func musicButtonPressed(_ sender: UIButton) {
        
        
    }
    
}

