//
//  CommandeModek.swift
//  Brooke&Co
//
//  Created by Guilherme Cintra Castro on 2023-11-06.
//

import Foundation

// MARK: - CommandeBody
struct CommandeBody: Codable {
    let date: String
    let idClient: Int
    let etat: String
}

// MARK: - CommandeResponse
struct CommandeResponse: Codable {
    let numero: Int
       let date: String
       let idClient: Int
       let etat: String
}
