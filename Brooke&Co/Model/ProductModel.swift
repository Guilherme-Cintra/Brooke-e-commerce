//
//  ProductModel.swift
//  Brooke&Co
//
//  Created by Guilherme Cintra Castro on 2023-11-03.
//

import Foundation

struct Product: Codable {
    let titre: String
        let prix: Double
        let description, image: String
        let quantiteEnStock, quantiteMinStock: Int
}


struct ProduitResponse: Codable {
    let id: Int
       let titre: String
       let prix: Double
       let description, image: String
       let quantiteEnStock, quantiteMinStock: Int
}

