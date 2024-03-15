//
//  GestionnaireModel.swift
//  Brooke&Co
//
//  Created by Guilherme Cintra Castro on 2023-11-07.
//

import Foundation

class Gestionnaire :Codable, Identifiable {
    let id: Int
    let nom: String
    let prenom: String
    let courriel: String
    let password: String
    
    init(id: Int, nom: String, prenom: String, courriel: String, password: String) {
        self.id = id
        self.nom = nom
        self.prenom = prenom
        self.courriel = courriel
        self.password = password
    }
}
