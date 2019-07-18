//
//  GitApiService.swift
//  Treinamento-iOS
//
//  Created by administrador on 17/07/19.
//  Copyright © 2019 Treinamento. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

protocol gitApiServiceDelegate {
    func success()
    func failure(error: String)
}

class GitApiService{
    
    var delegate: gitApiServiceDelegate!
    
    init(delegate: gitApiServiceDelegate) {
        self.delegate = delegate
    }
    
    func getRepositorios(username: String) {
        GitApiRequestFactory.getRepositorios(username: username).validate().responseArray { (response: DataResponse<[Repositorio]>) in
            
            switch response.result{
            case .success:
                    
                    if let repositorio = response.result.value {
                        RepositorioViewModel.saveAll(objects: repositorio, clear: true)
                    }
                    
                self.delegate.success()
                
            case .failure(let error):
                print(error.localizedDescription)
            
            
            }
        }
    }
}
