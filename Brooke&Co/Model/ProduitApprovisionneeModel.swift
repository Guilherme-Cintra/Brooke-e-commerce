//
//  ProduitApprovisionneeModel.swift
//  Brooke&Co
//
//  Created by Charlie Leduc on 2023-12-11.
//

import Foundation
struct ProduitApprovisionnee: Codable {
    let idProduit, numeroApprovisionnement, quantite: Int
    let prixReel: Double
}
