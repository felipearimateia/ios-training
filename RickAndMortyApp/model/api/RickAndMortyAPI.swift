//
//  CharacterAPI.swift
//  RickAndMortyApp
//
//  Created by Felipe Arimateia Terra Souza on 01/10/21.
//

import Foundation

protocol RickAndMortyAPIProtocol {
    func getCharacters(page: Int, completion: @escaping (Characters) -> ())
}

class RickAndMortyAPI: RickAndMortyAPIProtocol {
    
    let baseURL = "https://rickandmortyapi.com"
    
    func getCharacters(page: Int, completion: @escaping (Characters) -> ()) {
        let soruceURL = URL(string: "\(baseURL)/api/character/?page=\(page)")!
        
        URLSession.shared.dataTask(with: soruceURL) { (data, urlResponse, error) in
            
            if let data = data {
                let jsonDecoder = JSONDecoder()
                let empData = try! jsonDecoder.decode(Characters.self, from: data)
                completion(empData)
            }
            
        }.resume()
    }
    
    
}
