//
//  RepositorioViewModel.swift
//  Treinamento-iOS
//
//  Created by administrador on 17/07/19.
//  Copyright © 2019 Treinamento. All rights reserved.
//

import Foundation
import RealmSwift

class RepositorioView {
    
    var name = ""
    var languange = ""

}

class RepositorioViewModel {
    
  static  func save(object: Repositorio, clear: Bool)  {
    
    if clear{
        self.deleteAll()
    }
        
        try? uiRealm.write {
            uiRealm.add(object, update: .error)
        }
    }
        
    static  func saveAll(objects: [Repositorio], clear: Bool)  {
        
        if clear{
            self.deleteAll()
        }
        
    
        try? uiRealm.write {
            
            uiRealm.add(objects, update: Realm.UpdatePolicy.error)
        }
    }
 static   func get() -> [Repositorio]{
            
        let results = uiRealm.objects(Repositorio.self)
            
        var repositorios : [Repositorio] = []
        repositorios.append(contentsOf: results)
            
        return repositorios
    }
 static   func getAsView(repositorio: Repositorio?) -> RepositorioView{
            
        guard let repositorio = repositorio else {
                
            return RepositorioView()
        }
        
        let repositorioView = RepositorioView()
        
        repositorioView.name = repositorio.name ?? ""
        repositorioView.languange = repositorio.language ?? ""
        
        return repositorioView
    }
    
  static func getAsView(repositorios: [Repositorio]) -> [RepositorioView] {
        
        var repositoriosView: [RepositorioView] = []
        
        repositorios.forEach{ (repositorio) in
            repositoriosView.append(self.getAsView(repositorio: repositorio))
        }
        return repositoriosView
    }
    static func getAll() -> [RepositorioView]{
        
        return self.getAsView(repositorios: self.get())
    }
    
    static func deleteAll() {
        let results = uiRealm.objects(Repositorio.self)
        
        try? uiRealm.write{
            uiRealm.delete(results)
        }
    }
}
