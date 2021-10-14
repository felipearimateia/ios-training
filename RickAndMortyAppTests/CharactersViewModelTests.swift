//
//  CharactersViewModelTests.swift
//  RickAndMortyAppTests
//
//  Created by Felipe Arimateia Terra Souza on 13/10/21.
//

import XCTest
@testable import RickAndMortyApp

class CharactersViewModelTests: XCTestCase {
    
    func testShouldLoadingCharacters() {
        let mock = RickAndMortyAPIMock()
        let viewModel = CharactersViewModel(api: mock)
        let expectation = self.expectation(description: "loading")
        var characters: [Character] = []
        
        viewModel.onShowCharacters = { result in
            characters = result
            expectation.fulfill()
        }
        
        viewModel.fetchCharacters()
        
        waitForExpectations(timeout: 5, handler: nil)
        
        XCTAssertTrue(mock.getCharactersGotCalled)
        XCTAssertFalse(characters.isEmpty)
    }
    
    func testShouldFilterCharacters() {
        let mock = RickAndMortyAPIMock()
        let viewModel = CharactersViewModel(api: mock)
        let expectationLoading = self.expectation(description: "loading")
        let expectationFilter = self.expectation(description: "filter")
        var characters: [Character] = []
      
        
        viewModel.onShowCharacters = { result in
            expectationLoading.fulfill()
        }
        
        viewModel.fetchCharacters()
        
        viewModel.onShowCharacters = { result in
            characters = result
            expectationFilter.fulfill()
            
        }
        viewModel.filterSpecies(species: "Human")
        
        waitForExpectations(timeout: 5, handler: nil)
        
        XCTAssertEqual(2, characters.count)
    }

}
