//
//  CharacterResponse.swift
//  RickAndMortyApp
//
//  Created by Felipe Arimateia Terra Souza on 01/10/21.
//

import Foundation

struct Characters: Decodable {
    let results: [Character]
}

struct Character: Decodable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin: Origin
    let location: Location
    let image: String
    let episode: [String]
    let url: String
    let created: String
}
