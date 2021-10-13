//
//  CharactersViewModel.swift
//  RickAndMortyApp
//
//  Created by Felipe Arimateia Terra Souza on 01/10/21.
//

import Foundation

class CharactersViewModel {
    
    private let api: RickAndMortyAPIProtocol
    private(set) var characters: [Character] = []
    
    var onShowCharacters: (() -> Void)?
    
    init(api: RickAndMortyAPIProtocol) {
        self.api = api
    }
    
    func fetchCharacters(page: Int = 1) {
        api.getCharacters(page: page) { [weak self] characters in
            self?.characters.append(contentsOf: characters.results)
            self?.onShowCharacters?()
        }
    }
    
    
}
