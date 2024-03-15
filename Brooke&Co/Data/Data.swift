//
//  Data.swift
//  Brooke&Co
//
//  Created by Guilherme Cintra Castro on 2023-11-05.
//

import Foundation

// MARK: - JEUX

//let jeuxWIU: [Game] = [
//    Game(id:1,
//         titre: "Super Mario 3D World",
//         prix: 59.99,
//         description: "bla bla bla",
//         image: "game",
//         quantiteEnStock: 100,
//         quantiteMin: 10,
//         author: "Nintendo",
//         collection: "Mario Series"),
//         
//    Game(id:1,
//         titre: "Mario Kart 8",
//         prix: 49.99,
//         description: "bla bla bla",
//         image: "game",
//         quantiteEnStock: 50,
//         quantiteMin: 5,
//         author: "Nintendo",
//         collection: "Mario Kart Series"),
//         
//    Game(id:1,
//         titre: "The Legend of Zelda: Breath of the Wild",
//         prix: 59.99,
//         description: "bla bla bla",
//         image: "game",
//         quantiteEnStock: 70,
//         quantiteMin: 10,
//         author: "Nintendo",
//         collection: "The Legend of Zelda Series")
//    
//]
//var jeuxXBox: [Game] = [
//    Game(  id:1,       titre: "Super Mario 3D World",
//         prix: 59.99,
//         description: "bla bla bla",
//         image: "game",
//         quantiteEnStock: 100,
//         quantiteMin: 10,
//         author: "Nintendo",
//         collection: "Mario Series"),
//         
//    Game(id:1,
//         titre: "Mario Kart 8",
//         prix: 49.99,
//         description: "bla bla bla",
//         image: "game",
//         quantiteEnStock: 50,
//         quantiteMin: 5,
//         author: "Nintendo",
//         collection: "Mario Kart Series"),
//         
//    Game(id:1,
//         titre: "The Legend of Zelda: Breath of the Wild",
//         prix: 59.99,
//         description: "bla bla bla",
//         image: "game",
//         quantiteEnStock: 70,
//         quantiteMin: 10,
//         author: "Nintendo",
//         collection: "The Legend of Zelda Series")
//    
//]
//
//var jeuxPS : [Game] = [
//    Game(id:1,
//         titre: "Super Mario 3D World",
//         prix: 59.99,
//         description: "bla bla bla",
//         image: "game",
//         quantiteEnStock: 100,
//         quantiteMin: 10,
//         author: "Nintendo",
//         collection: "Mario Series"),
//         
//    Game(id:1,
//         titre: "Mario Kart 8",
//         prix: 49.99,
//         description: "bla bla bla",
//         image: "game",
//         quantiteEnStock: 50,
//         quantiteMin: 5,
//         author: "Nintendo",
//         collection: "Mario Kart Series"),
//         
//    Game(id:1,
//         titre: "The Legend of Zelda: Breath of the Wild",
//         prix: 59.99,
//         description: "bla bla bla",
//         image: "game",
//         quantiteEnStock: 70,
//         quantiteMin: 10,
//         author: "Nintendo",
//         collection: "The Legend of Zelda Series")
//    
//]

// MARK: - FILMS



//var filmsFiction : [Movie] = [
//    Movie(id:1, titre: "uyhishaha ", prix: 20.0, description: "rhebdjasnk", image: "harry", quantiteEnStock: 20, quantiteMin: 40, acteurs: "Jean", realisateur: "Jean jim", format: "DVD", extraitVideo: "", categorie: "Drame"),
//    Movie(id:1, titre: "uyhishaha ", prix: 20.0, description: "rhebdjasnk", image: "harry", quantiteEnStock: 20, quantiteMin: 40, acteurs: "Jean", realisateur: "Jean jim", format: "DVD", extraitVideo: "", categorie: "Drame"),
//    Movie(id:1, titre: "uyhishaha ", prix: 20.0, description: "rhebdjasnk", image: "harry", quantiteEnStock: 20, quantiteMin: 40, acteurs: "Jean", realisateur: "Jean jim", format: "DVD", extraitVideo: "", categorie: "Drame")
//]
//
//var filmsAction : [Movie] = [
//    Movie(id:1, titre: "uyhishaha ", prix: 20.0, description: "rhebdjasnk", image: "harry", quantiteEnStock: 20, quantiteMin: 40, acteurs: "Jean", realisateur: "Jean jim", format: "DVD", extraitVideo: "", categorie: "Drame"),
//    Movie(id:1, titre: "uyhishaha ", prix: 20.0, description: "rhebdjasnk", image: "harry", quantiteEnStock: 20, quantiteMin: 40, acteurs: "Jean", realisateur: "Jean jim", format: "DVD", extraitVideo: "", categorie: "Drame"),
//    Movie(id:1, titre: "uyhishaha ", prix: 20.0, description: "rhebdjasnk", image: "harry", quantiteEnStock: 20, quantiteMin: 40, acteurs: "Jean", realisateur: "Jean jim", format: "DVD", extraitVideo: "", categorie: "Drame")
//]
//
//var filmsComedie : [Movie] = [
//    Movie(id:1, titre: "uyhishaha ", prix: 20.0, description: "rhebdjasnk", image: "harry", quantiteEnStock: 20, quantiteMin: 40, acteurs: "Jean", realisateur: "Jean jim", format: "DVD", extraitVideo: "", categorie: "Drame"),
//    Movie(id:1, titre: "uyhishaha ", prix: 20.0, description: "rhebdjasnk", image: "harry", quantiteEnStock: 20, quantiteMin: 40, acteurs: "Jean", realisateur: "Jean jim", format: "DVD", extraitVideo: "", categorie: "Drame"),
//    Movie(id:1, titre: "uyhishaha ", prix: 20.0, description: "rhebdjasnk", image: "harry", quantiteEnStock: 20, quantiteMin: 40, acteurs: "Jean", realisateur: "Jean jim", format: "DVD", extraitVideo: "", categorie: "Drame")
//]
//
//// MARK: - LIVRES
//var livresInfo = [Book(id:1, titre: "uvhbjk", prix: 20.0, description: "ycgvhbjn", image: "harry", quantiteEnStock: 20, quantiteMin: 10, isbn: "76839897987", dateParution: Date(), editeur: "HEhbirenk", auteur: "brewijn", categories: "Informatique"),
//                  Book(id:1, titre: "uvhbjk", prix: 20.0, description: "ycgvhbjn", image: "harry", quantiteEnStock: 20, quantiteMin: 10, isbn: "76839897987", dateParution: Date(), editeur: "HEhbirenk", auteur: "brewijn", categories: "Informatique"),
//                  Book(id:1, titre: "uvhbjk", prix: 20.0, description: "ycgvhbjn", image: "harry", quantiteEnStock: 20, quantiteMin: 10, isbn: "76839897987", dateParution: Date(), editeur: "HEhbirenk", auteur: "brewijn", categories: "Informatique")]
//
//var livresLitterature = [Book(id:1, titre: "uvhbjk", prix: 20.0, description: "ycgvhbjn", image: "harry", quantiteEnStock: 20, quantiteMin: 10, isbn: "76839897987", dateParution: Date(), editeur: "HEhbirenk", auteur: "brewijn", categories: "Informatique"),
//                         Book( id:1,titre: "uvhbjk", prix: 20.0, description: "ycgvhbjn", image: "harry", quantiteEnStock: 20, quantiteMin: 10, isbn: "76839897987", dateParution: Date(), editeur: "HEhbirenk", auteur: "brewijn", categories: "Informatique"),
//                         Book( id:1,titre: "uvhbjk", prix: 20.0, description: "ycgvhbjn", image: "harry", quantiteEnStock: 20, quantiteMin: 10, isbn: "76839897987", dateParution: Date(), editeur: "HEhbirenk", auteur: "brewijn", categories: "Informatique")]
//
//var livresGeo = [Book(id:1, titre: "uvhbjk", prix: 20.0, description: "ycgvhbjn", image: "harry", quantiteEnStock: 20, quantiteMin: 10, isbn: "76839897987", dateParution: Date(), editeur: "HEhbirenk", auteur: "brewijn", categories: "Informatique"),
//                 Book(id:1, titre: "uvhbjk", prix: 20.0, description: "ycgvhbjn", image: "harry", quantiteEnStock: 20, quantiteMin: 10, isbn: "76839897987", dateParution: Date(), editeur: "HEhbirenk", auteur: "brewijn", categories: "Informatique"),
//                 Book(id:1, titre: "uvhbjk", prix: 20.0, description: "ycgvhbjn", image: "harry", quantiteEnStock: 20, quantiteMin: 10, isbn: "76839897987", dateParution: Date(), editeur: "HEhbirenk", auteur: "brewijn", categories: "Informatique")]
//
//// MARK: - PRODUITS PANIER
//
//var cartProducts : [Product] = [Game( id:1,titre: "God Of War", prix: 40.0, description: "No symbol named 'minus.app' found in system symbol set", image: "game", quantiteEnStock: 40, quantiteMin: 20, author: "John Fury", collection: "Hannah Barbera"),
//                                Book(id:1, titre: "Harry Potter", prix: 20.0, description: "No symbol named 'minus.app' found in system symbol set", image: "harry", quantiteEnStock: 20, quantiteMin: 10, isbn: "78297", dateParution: Date(), editeur: "YGHU", auteur: "J.K. ROWLING", categories: "Sorciers")]
//
//
//// MARK: - PRODUITS MAGASIN
//
//var produits : [Product] = [Game(id:1,titre: "God Of War", prix: 40.0, description: "No symbol named 'minus.app' found in system symbol set", image: "game", quantiteEnStock: 40, quantiteMin: 20, author: "John Fury", collection: "Hannah Barbera"),
//                            Book(id:1, titre: "Harry Potter", prix: 20.0, description: "No symbol named 'minus.app' found in system symbol set", image: "harry", quantiteEnStock: 20, quantiteMin: 10, isbn: "78297", dateParution: Date(), editeur: "YGHU", auteur: "J.K. ROWLING", categories: "Sorciers")
//]
//
//// MARK: - COMMANDES
//
//var commandes: [Commande] = [Commande(numero: 1, date: "10/11/1998", idClient: 1, etat: "Expedié"),
//                            Commande(numero: 2, date: "04/04/2001", idClient: 2, etat: "Expedié"),
//                             Commande(numero: 3, date: "05/05/2022", idClient: 3, etat: "Payé"), Commande(numero: 4, date: "05/05/2022", idClient: 1, etat: "Payé")]
//// MARK: - CLIENTS
//
//var clients: [Client] = [Client(id: 1, nom: "Pierre", prenom: "Julien", courriel: "jp@i.com", password: "123")]
//
//// MARK: - GESTIONNAIRES
//
//var gestionnaires : [Gestionnaire] = [Gestionnaire(id: 1, nom: "Silvestre", prenom: "Jean", courriel: "jean@email.com", password: "123")]
//
//// MARK: - PANIER
//
//
//
