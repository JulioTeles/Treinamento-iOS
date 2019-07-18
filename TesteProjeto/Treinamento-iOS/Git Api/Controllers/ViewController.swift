//
//  ViewController.swift
//  Treinamento-iOS
//
//  Created by Jobson Mateus on 12/07/19.
//  Copyright © 2019 Treinamento. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textFiled: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    var service: GitApiService!
    var repositorioView: [RepositorioView] = []
    var strings: [(String)] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.service = GitApiService(delegate: self)
        
        self.setuptableView()
        
    }
    
    func setuptableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.register(cellType: RepositorioTableViewCell.self)
    }
    
    @IBAction func Button(_ sender: Any) {
      
        self.service.getRepositorios(username: self.textFiled.text ?? "")
        
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.repositorioView.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath) as RepositorioTableViewCell
        
        cell.bind(repositorio: self.repositorioView[indexPath.row])
        
        return cell
    }
}

extension ViewController: gitApiServiceDelegate {
    func success() {
        self.repositorioView = RepositorioViewModel.getAll()
        self.tableView.reloadData()
        
//        for repositorio in self.repositorioView {
//            print("$$$$$$$$$$$$$$$$$$$$$$")
//            print("nome: \(repositorio.name)")
//            print("language: \(repositorio.languange)")
//        }
    }
    func failure(error: String) {
        print(error)
    }
}
