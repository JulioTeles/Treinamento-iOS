//
//  ViewController.swift
//  Treinamento-iOS
//
//  Created by Jobson Mateus on 12/07/19.
//  Copyright © 2019 Treinamento. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var number: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
 
    }
    @IBAction func buttonEdit(_ sender: Any) {
        let callView = StoryboardScene.Main.secondViewController.instantiate()
        
        callView.name = self.name.text ?? ""
        callView.number = self.number.text ?? ""
        callView.delegate = self

        self.present(callView, animated: true)
        
    }
}

extension ViewController:SecondViewControllerDelegate{
    func update(name: String, number: String){
        self.name.text = name
        self.number.text = number
    }
}
