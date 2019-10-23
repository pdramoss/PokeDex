//
//  HomeTableViewCell.swift
//  PokeDex
//
//  Created by Pedro Ramos on 23/10/19.
//  Copyright © 2019 Pedro Ramos. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var imagePokemonView: UIImageView!
    @IBOutlet private weak var namePokemonLabel: UILabel!
    @IBOutlet private weak var idPokemonLabel: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.fromNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.fromNib()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func formatId(id: Int) -> String {
        return "#\t\(id.numberWithZeros(number: 5))"
    }
    
    func setup(name: String, id: Int) {
        namePokemonLabel.text = name.capitalized
        idPokemonLabel.text = formatId(id: id)
        getImage(id: id)
    }
    
    private func getImage(id: Int) {
        let manager = NetworkManager()
        
        manager.getFrontDefaultImage(id: id) { (response) in
            switch response {
            case .success(let image):
                DispatchQueue.main.async {
                    self.imagePokemonView.image = image
                }
            default: break
            }
        }
        
    }
}
