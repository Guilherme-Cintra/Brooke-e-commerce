//
//  BookModel.swift
//  Brooke&Co
//
//  Created by Guilherme Cintra Castro on 2023-11-03.
//

import Foundation

//class Book : Product {
//   
//    
//    var isbn : String
//    var dateParution: Date
//    var editeur: String
//    var auteur: String
//    var categories: String
//    
//    init(id:Int, titre: String, prix: Double, description: String, image: String, quantiteEnStock: Int, quantiteMin: Int, isbn: String, dateParution: Date, editeur: String, auteur: String, categories: String) {
//        self.isbn = isbn
//        self.dateParution = dateParution
//        self.editeur = editeur
//        self.auteur = auteur
//        self.categories = categories
//        
//        super.init(id: id, titre: titre, prix: prix, description: description, image: image, quantiteEnStock: quantiteEnStock, quantiteMin: quantiteEnStock)
//            }
//    
//    
//    required init(from decoder: Decoder) throws {
//        fatalError("init(from:) has not been implemented")
//    }
//}

struct Livre: Codable, Identifiable {
    let id: Int
    let titre: String
    let prix: Double
    let description, image: String
    let quantiteEnStock, quantiteMinStock: Int
    let isbn, dateParution, editeur, auteurs: String
    let categories: String

    enum CodingKeys: String, CodingKey {
        case id, titre, prix, description, image, quantiteEnStock, quantiteMinStock
        case isbn = "ISBN"
        case dateParution, editeur, auteurs, categories
    }
}


struct LivreResponse: Codable {
    let id: Int
    let titre: String
    let prix: Double
    let description, image: String
    let quantiteEnStock, quantiteMinStock: Int
    let isbn, dateParution, editeur, auteurs: String
    let categories: String

    enum CodingKeys: String, CodingKey {
        case id, titre, prix, description, image, quantiteEnStock, quantiteMinStock
        case isbn = "ISBN"
        case dateParution, editeur, auteurs, categories
    }
}
