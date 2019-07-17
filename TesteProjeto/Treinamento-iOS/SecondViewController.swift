//
//  SecondViewController.swift
//  Treinamento-iOS
//
//  Created by administrador on 16/07/19.
//  Copyright © 2019 Treinamento. All rights reserved.
//

import UIKit
protocol SecondViewControllerDelegate {
    func update(name: String, number: String)
}

class SecondViewController: UIViewController {

    @IBOutlet weak var textFieldName: UITextField!
    @IBOutlet weak var textFieldNumber: UITextField!
    @IBOutlet weak var profilePic: UIImageView!
    
    var name = ""
    var number = ""
    
    var delegate: SecondViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        profilePic.layer.cornerRadius = profilePic.frame.size.width / 2
        profilePic.clipsToBounds = true
        
        self.textFieldName.text = self.name
        self.textFieldNumber.text = self.number
    }
    

    @IBAction func buttonConfirm(_ sender: Any) {
        self.delegate.update(name: self.textFieldName.text ?? "", number: self.textFieldNumber.text ?? "")
            self.dismiss(animated: true)
    }
}
