//
//  CharactersRepository.swift
//  RickAndMortyApp
//
//  Created by Felipe Arimateia Terra Souza on 17/02/22.
//

import Foundation

class CharactersRepository: CharactersRepositoryProtocol {
    private let api: RickAndMortyAPIProtocol
    
    init(api: RickAndMortyAPIProtocol) {
        self.api = api
    }
    
    func loadCharacters(page: Int, completion: @escaping (Characters) -> () ) {
        api.getCharacters(page: page, completion: completion)
    }
}
