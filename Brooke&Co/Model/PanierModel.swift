//
//  PanierModel.swift
//  Brooke&Co
//
//  Created by Charlie Leduc on 2023-12-06.
//

import Foundation

struct ItemPanier: Codable {
    let idClient, idProduit: Int
    let imageProduit, titreProduit: String
    let prixProduit: Double
}
struct ItemResponse: Codable, Hashable {
    let id, idClient, idProduit: Int
        let imageProduit, titreProduit: String
        let prixProduit: Double
}
