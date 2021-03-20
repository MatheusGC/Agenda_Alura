//
//  AlunoAPI.swift
//  Agenda
//
//  Created by Matheus Golke Cardoso on 19/03/21.
//  Copyright © 2021 Alura. All rights reserved.
//

import UIKit
import Alamofire

class AlunoAPI: NSObject {
   
    //MARK: - GET
    
    func recuperaALunos(){
        Alamofire.request("http://localhost:8080/api/aluno", method: .get).responseJSON{(response) in
            switch response.result {
            case .success:
                  print(response.result.value!)
                  break
            case .failure:
                 print(response.error!)
                 break
            }
        }
    }
    
    //MARK: - PUT
    func salvaAlunosNoServidor(parametros:Array<Dictionary<String, String>>){
        guard let url = URL(string: "http://localhost:8080/api/aluno/lista") else {return}
        
        var requisicao = URLRequest(url: url)
        
        requisicao.httpMethod = "PUT"
        
        let json = try! JSONSerialization.data(withJSONObject: parametros, options: [])
        
        requisicao.httpBody = json
        
        requisicao.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        Alamofire.request(requisicao)
    }
}
