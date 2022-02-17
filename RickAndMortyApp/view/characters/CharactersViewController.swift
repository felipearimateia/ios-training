//
//  CharactersViewController.swift
//  RickAndMortyApp
//
//  Created by Felipe Arimateia Terra Souza on 01/10/21.
//

import Foundation
import UIKit

class CharactersViewController: UIViewController {
    
    private lazy var viewModel: CharactersViewModel = AppContainer.shared.resolve(CharactersViewModel.self)!
    
//    private lazy var api: RickAndMortyAPIProtocol = RickAndMortyAPI()
//    private lazy var reporitory: CharactersRepositoryProtocol = CharactersRepository(api: api)
//    private lazy var viewModel: CharactersViewModel = CharactersViewModel(repository: reporitory)
    
    private var characters: [Character] = []
    
    private lazy var tableView: UITableView = {
        let view = UITableView()
        view.register(CharacterViewCell.self, forCellReuseIdentifier: CharacterViewCell.identifier)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.onShowCharacters = { characters in
            DispatchQueue.main.async {
                self.characters = characters
                self.tableView.reloadData()
            }
        }
        viewModel.fetchCharacters()
    }
}

extension CharactersViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CharacterViewCell.identifier, for: indexPath) as! CharacterViewCell
        cell.character = self.characters[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let character = self.characters[indexPath.row]
        let controller = AppContainer.shared.resolve(CharacterDetailViewController.self, argument: character.id)
        self.navigationController?.pushViewController(controller!, animated: true)
    }
    
}
