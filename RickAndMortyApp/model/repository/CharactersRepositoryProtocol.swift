//
//  CharactersRepositoryProtocol.swift
//  RickAndMortyApp
//
//  Created by Felipe Arimateia Terra Souza on 17/02/22.
//

import Foundation

protocol CharactersRepositoryProtocol {
    func loadCharacters(page: Int, completion: @escaping (Characters) -> ())
}
