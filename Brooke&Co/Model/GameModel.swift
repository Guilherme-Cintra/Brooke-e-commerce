//
//  GameModel.swift
//  Brooke&Co
//
//  Created by Guilherme Cintra Castro on 2023-11-03.
//

import Foundation

//class Game : Product {
//
//    
// 
//    let author: String
//    let collection: String
//    
//    init(id:Int, titre: String, prix: Double, description: String, image: String, quantiteEnStock: Int, quantiteMin: Int,author: String, collection: String) {
//        
//        self.author = author
//        self.collection = collection
//        
//        super.init(id:id, titre: titre, prix: prix, description: description,
//                         image: image, quantiteEnStock: quantiteEnStock, quantiteMin: quantiteMin)
//               
//    }
//    
//    required init(from decoder: Decoder) throws {
//        fatalError("init(from:) has not been implemented")
//    }
//}

struct Jeu: Codable, Identifiable {
    let id: Int
    let titre: String
    let prix: Double
    let description, image: String
    let quantiteEnStock, quantiteMinStock: Int
    let auteurs, collection: String
}
