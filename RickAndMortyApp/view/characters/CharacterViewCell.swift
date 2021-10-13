//
//  CharacterCellView.swift
//  RickAndMortyApp
//
//  Created by Felipe Arimateia Terra Souza on 04/10/21.
//

import Foundation
import UIKit
import SDWebImage

class CharacterViewCell: UITableViewCell {

    private let cover: UIImageView = {
       let _cover = UIImageView()
        _cover.contentMode = .scaleAspectFit
        return _cover
    }()
    
    private let lblName: UILabel = {
        let _lblName = UILabel()
        return _lblName
    }()
    
    private let stackView: UIStackView = {
        let _stackView = UIStackView()
        _stackView.axis = .horizontal
        _stackView.spacing = 0
        _stackView.distribution = .fillEqually
        return _stackView
    }()
    
    
    var character: Character? {
        didSet {
            guard let character = character else { return }
            cover.sd_setImage(with: URL(string: character.image), completed: nil)
            lblName.text = character.name
        }
    }
    
    static let identifier = "CharacterViewCell"
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(stackView)
        stackView.addArrangedSubview(cover)
        stackView.addArrangedSubview(lblName)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(code:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0))
        
        stackView.frame = contentView.bounds
        cover.frame = CGRect(x: 0, y: 0, width: 60, height: contentView.bounds.height)
        
    }
}
