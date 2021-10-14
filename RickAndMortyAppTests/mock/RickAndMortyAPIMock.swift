//
//  RickAndMortyAPIMock.swift
//  RickAndMortyAppTests
//
//  Created by Felipe Arimateia Terra Souza on 13/10/21.
//

import Foundation
import XCTest
@testable import RickAndMortyApp

class RickAndMortyAPIMock: RickAndMortyAPIProtocol {
    var getCharactersGotCalled = false
    
    func getCharacters(page: Int, completion: @escaping (Characters) -> ()) {
        getCharactersGotCalled = true
        completion(mockCharactes())
    }
    
    private func mockCharactes() -> Characters {
        let mock = Characters(results: mockItems())
        return mock
    }
    
    private func mockItems() -> [Character] {
        let character1 = Character(id: 21, name: "Aqua Morty", status: "unknown", species: "Humanoid", type: "Fish-Person", gender: "Male", origin: Origin(name: "unknown", url: ""), location: Location(name: "Citadel of Ricks", url: "https://rickandmortyapi.com/api/location/3"), image: "https://rickandmortyapi.com/api/character/avatar/21.jpeg", episode: ["https://rickandmortyapi.com/api/episode/10", "https://rickandmortyapi.com/api/episode/22"], url: "https://rickandmortyapi.com/api/character/21", created: "2017-11-04T22:39:48.055Z")
        
        let character2 = Character(id: 1, name: "Rick Sanchez", status: "Alive", species: "Human", type: "", gender: "Male", origin: Origin(name: "Earth (C-137)", url: "https://rickandmortyapi.com/api/location/1"), location: Location(name: "Earth (Replacement Dimension)", url: "https://rickandmortyapi.com/api/location/20"), image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg", episode: ["https://rickandmortyapi.com/api/episode/1", "https://rickandmortyapi.com/api/episode/2"], url: "https://rickandmortyapi.com/api/character/1", created: "2017-11-04T18:48:46.250Z")
        
        let character3 = Character(id: 2, name: "Morty Smith", status: "Alive", species: "Human", type: "", gender: "Male", origin: Origin(name: "Earth (C-137)", url: "https://rickandmortyapi.com/api/location/1"), location: Location(name: "Earth (Replacement Dimension)", url: "https://rickandmortyapi.com/api/location/20"), image: "https://rickandmortyapi.com/api/character/avatar/2.jpeg", episode: ["https://rickandmortyapi.com/api/episode/1", "https://rickandmortyapi.com/api/episode/2"], url: "https://rickandmortyapi.com/api/character/1", created: "2017-11-04T18:50:21.651Z")
        
        let character4 = Character(id: 363, name: "Trandor", status: "Alive", species: "Alien", type: "Krootabulan", gender: "Male", origin: Origin(name: "Krootabulon", url: "https://rickandmortyapi.com/api/location/45"), location: Location(name: "Earth (Replacement Dimension)", url: "https://rickandmortyapi.com/api/location/20"), image: "https://rickandmortyapi.com/api/character/avatar/363.jpeg", episode: ["https://rickandmortyapi.com/api/episode/30"], url: "https://rickandmortyapi.com/api/character/363", created: "2018-01-10T18:54:36.578Z")

        
        return [character1, character2, character3, character4]
    }
}
