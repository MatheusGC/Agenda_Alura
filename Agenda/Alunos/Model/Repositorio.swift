//
//  Repositorio.swift
//  Agenda
//
//  Created by Matheus Golke Cardoso on 19/03/21.
//  Copyright © 2021 Alura. All rights reserved.
//

import UIKit

class Repositorio: NSObject {
    
    func salvaAluno(aluno: Dictionary<String, String>){
        AlunoAPI().salvaAlunosNoServidor(parametros: [aluno])
        AlunoDAO().salvaAluno(dicionarioDeAluno: aluno)
    }

}
