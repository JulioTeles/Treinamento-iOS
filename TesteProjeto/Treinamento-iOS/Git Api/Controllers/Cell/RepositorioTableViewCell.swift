//
//  RepositorioTableViewCell.swift
//  Treinamento-iOS
//
//  Created by administrador on 18/07/19.
//  Copyright © 2019 Treinamento. All rights reserved.
//

import UIKit
import Reusable

class RepositorioTableViewCell: UITableViewCell, NibReusable {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func bind(repositorio: RepositorioView){
        self.nameLabel.text = repositorio.name
        self.languageLabel.text = repositorio.languange
    }
}
