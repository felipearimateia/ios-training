//
//  CharacterDetailViewController.swift
//  RickAndMortyApp
//
//  Created by Felipe Arimateia Terra Souza on 06/10/21.
//

import UIKit

class CharacterDetailViewController: UIViewController {
    
    private let characterId: Int
    
    @IBOutlet weak var characterImageView: UIImageView!
    
    @IBOutlet weak var lblName: UILabel!
    
    init(characterId: Int) {
        self.characterId = characterId
        super.init(nibName: "CharacterDetailViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(code:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
