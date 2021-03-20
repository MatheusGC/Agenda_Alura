//
//  Repositorio.swift
//  Agenda
//
//  Created by Matheus Golke Cardoso on 19/03/21.
//  Copyright © 2021 Alura. All rights reserved.
//

import UIKit

class Repositorio: NSObject {
    
    func recuperaAlunos(completion:@escaping(_ listaDeAlunos:Array<Aluno>) -> Void){
        var alunos = AlunoDAO().recuperaAlunos()
        if alunos.count == 0 {
            AlunoAPI().recuperaALunos {
                alunos = AlunoDAO().recuperaAlunos()
                completion(alunos)
            }
        }else{
            completion(alunos)
        }
    }
    
    func salvaAluno(aluno: Dictionary<String, String>){
        AlunoAPI().salvaAlunosNoServidor(parametros: [aluno])
        AlunoDAO().salvaAluno(dicionarioDeAluno: aluno)
    }
    
    func deletaAluno(aluno:Aluno){
        guard let id = aluno.id else {return}
        AlunoAPI().deletaAluno(id: String(describing: id).lowercased())
        AlunoDAO().deletaAluno(aluno: aluno)
    }

}
