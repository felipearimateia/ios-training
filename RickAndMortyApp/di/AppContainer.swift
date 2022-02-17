//
//  AppContainer.swift
//  RickAndMortyApp
//
//  Created by Felipe Arimateia Terra Souza on 04/10/21.
//

import Foundation
import Swinject

class AppContainer {
    
    public static let shared: Container = {
        let container = Container()
        
        container.register(RickAndMortyAPIProtocol.self) { _ in RickAndMortyAPI() }
        
        container.register(CharactersRepositoryProtocol.self) { r in CharactersRepository(api:
            r.resolve(RickAndMortyAPIProtocol.self)!)
        }
            
        container.register(CharactersViewModel.self) { r in CharactersViewModel(repository: r.resolve(CharactersRepositoryProtocol.self)!)
        }
        
        container.register(CharacterDetailViewController.self) { _, characterId in
            CharacterDetailViewController(characterId: characterId)
        }
        
        return container
    }()
}
