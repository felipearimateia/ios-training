//
//  CharactersViewModel.swift
//  RickAndMortyApp
//
//  Created by Felipe Arimateia Terra Souza on 01/10/21.
//

import Foundation

class CharactersViewModel {
    
    private let repository: CharactersRepositoryProtocol
    private var characters: [Character] = []
    
    var onShowCharacters: (([Character]) -> Void)?
    
    init(repository: CharactersRepositoryProtocol) {
        self.repository = repository
    }
    
    func fetchCharacters(page: Int = 1) {
        repository.loadCharacters(page: page) { [weak self] characters in
            self?.characters.append(contentsOf: characters.results)
            self?.onShowCharacters?(self!.characters)
        }
    }
    
    func filterSpecies(species: String) {
        let filter = characters.filter{ $0.species == species }
        self.onShowCharacters?(filter)
    }
    
    
}
