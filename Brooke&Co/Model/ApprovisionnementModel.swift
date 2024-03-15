//
//  ApprovisionnementModel.swift
//  Brooke&Co
//
//  Created by Charlie Leduc on 2023-12-11.
//

import Foundation

struct Approvisionnement: Codable {
    
    let date: String
    let idFournisseur: Int
    let etat: String
    
}

struct ApprovisionnementReponse: Codable {
    
    let numero: Int
    let date: String
    let idFournisseur: Int
    let etat: String
    
}
