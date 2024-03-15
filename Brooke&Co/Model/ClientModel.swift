//
//  ClientModel.swift
//  Brooke&Co
//
//  Created by Guilherme Cintra Castro on 2023-11-07.
//

import Foundation

struct Client: Codable {
    let id: Int
    let nom, prenom, courriel, password: String
}

class ClientBody: Codable, Identifiable {

    let nom : String
    let prenom : String
    let courriel : String
    let password : String
    
    init(nom: String, prenom: String, courriel: String, password: String) {
      
        self.nom = nom
        self.prenom = prenom
        self.courriel = courriel
        self.password = password
    }
}
