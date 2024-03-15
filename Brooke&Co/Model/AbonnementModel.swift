//
//  AbonnementModel.swift
//  Brooke&Co
//
//  Created by Charlie Leduc on 2023-12-12.
//

import Foundation

// MARK: - Abonnement
struct Abonnement: Codable {
    let idClient: Int
    let dateDebut, dateFin: String
}
