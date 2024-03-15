//
//  MovieModel.swift
//  Brooke&Co
//
//  Created by Guilherme Cintra Castro on 2023-11-03.
//

import Foundation
class Movie : Codable, Identifiable {


    var id : Int
    var titre : String
    var prix: String
    var description : String
    var image : String
    var quantiteEnStock : Int
    var quantiteMin: Int
    var acteurs : String
    var realisateur : String
    var format : String
    var extraitVideo : String
    var categorie : String
    
    init(id: Int, titre: String, prix: String, description: String, image: String, quantiteEnStock: Int, quantiteMin: Int, acteurs: String, realisateur: String, format: String, extraitVideo: String, categorie: String) {
        self.id = id
        self.titre = titre
        self.prix = prix
        self.description = description
        self.image = image
        self.quantiteEnStock = quantiteEnStock
        self.quantiteMin = quantiteMin
        self.acteurs = acteurs
        self.realisateur = realisateur
        self.format = format
        self.extraitVideo = extraitVideo
        self.categorie = categorie
    }
    

}

class MovieReponse : Codable, Identifiable {
    var id : Int
    var titre : String
    var prix: String
    var description : String
    var image : String
    var quantiteEnStock : Int
    var quantiteMin: Int
    var acteurs : String
    var realisateur : String
    var format : String
    var extraitVideo : String
    var categorie : String
    
    init(id: Int, titre: String, prix: String, description: String, image: String, quantiteEnStock: Int, quantiteMin: Int, acteurs: String, realisateur: String, format: String, extraitVideo: String, categorie: String) {
        self.id = id
        self.titre = titre
        self.prix = prix
        self.description = description
        self.image = image
        self.quantiteEnStock = quantiteEnStock
        self.quantiteMin = quantiteMin
        self.acteurs = acteurs
        self.realisateur = realisateur
        self.format = format
        self.extraitVideo = extraitVideo
        self.categorie = categorie
    }
}

struct Film: Codable, Identifiable,Hashable {
    let id: Int
      let titre: String
      let prix: Double
      let description, image: String
      let quantiteEnStock, quantiteMinStock: Int
      let acteurs, realisateur, format, videoExtrait: String
      let categories: String
}
