//
//  LigneCommandeModel.swift
//  Brooke&Co
//
//  Created by Charlie Leduc on 2023-12-06.
//

import Foundation
struct LigneCommande: Codable {
    let idProduit, numeroCommande, quantite: Int
    let prixReel: Double
}
