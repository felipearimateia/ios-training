//
//  CharactersViewModel.swift
//  RickAndMortyApp
//
//  Created by Felipe Arimateia Terra Souza on 01/10/21.
//

import Foundation

class CharactersViewModel {
    
    private let api = RickAndMortyAPI()
    private(set) var characters: [Character] = []
    
    var onShowCharacters: (() -> Void)?
    
    func fetchCharacters(page: Int = 1) {
        api.getCharacters(page: page) { [weak self] characters in
            self?.characters.append(contentsOf: characters.results)
            self?.onShowCharacters?()
        }
    }
    
    
}
