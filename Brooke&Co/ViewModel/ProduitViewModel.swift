//
//  ProduitViewModel.swift
//  Brooke&Co
//
//  Created by Charlie Leduc on 2023-12-03.
//

import Foundation

class ProduitViewModel {
    
    //    var filmsDrame: [Movie] = []
    
    
    func getFilmsDrame(completion:@escaping ([Movie]) -> ()) {
        guard let url = URL(string: "http://localhost:1000/api/films/drame") else { return }
        
        URLSession.shared.dataTask(with: url) {(data, _,_) in
            let movies = try! JSONDecoder().decode([Movie].self, from: data!)
            print(movies)
            
            DispatchQueue.main.async {
                completion(movies)
            }
        }
        .resume()
    }
    
    func postProduct( titre: String, prix: Double, description: String, image: String, quantite: Int, quantiteMin: Int, completion: @escaping (ProduitResponse) -> ()) {
        let url = URL(string: "http://localhost:1000/api/produits/")
        guard let requestUrl = url else { fatalError() }
        
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
        
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let newProductItem = Product(titre: titre, prix: prix, description: description, image: image, quantiteEnStock: quantite, quantiteMinStock: quantiteMin)
            let jsonData = try JSONEncoder().encode(newProductItem)
            request.httpBody = jsonData
        } catch let jsonErr {
            print(jsonErr)
            
            return
        }
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Error took place \(error)")
                
                return
            }
            
            guard let data = data else {
                
                return
            }
            
            do {
                let productItemModel = try JSONDecoder().decode(ProduitResponse.self, from: data)
                print("Response data:\n\(productItemModel)")
                completion(productItemModel) //Retourner produit
            } catch let jsonErr {
                print(jsonErr)
                
            }
        }
        task.resume()
    }
    
    
    func postLivre( produit: ProduitResponse,prix:Double, isbn: String, dateParution: String,editeur: String,auteurs:String, categories:String, completion: @escaping (LivreResponse) -> ()) {
        let url = URL(string: "http://localhost:1000/api/livres/")
        guard let requestUrl = url else { fatalError() }
        
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
        
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        
        do {
            let livre = Livre(id: produit.id, titre: produit.titre, prix: prix, description: produit.description, image: produit.image, quantiteEnStock: produit.quantiteEnStock, quantiteMinStock: produit.quantiteMinStock, isbn: isbn, dateParution: dateParution, editeur: editeur, auteurs: auteurs, categories: categories)
            let jsonData = try JSONEncoder().encode(livre)
            request.httpBody = jsonData
        } catch let jsonErr {
            print(jsonErr)
            
            return
        }
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Error took place \(error)")
                
                return
            }
            
            guard let data = data else {
                
                return
            }
            
            do {
                let livreResponse = try JSONDecoder().decode(LivreResponse.self, from: data)
                print("Response data:\n\(livreResponse)")
                completion(livreResponse) //Retourner Livre
            } catch let jsonErr {
                print(jsonErr)
                
            }
        }
        task.resume()
    }
    
    
    func postJeu( produit: ProduitResponse,prix:Double,auteurs:String, collection:String, completion: @escaping (Jeu) -> ()) {
        let url = URL(string: "http://localhost:1000/api/jeux/")
        guard let requestUrl = url else { fatalError() }
        
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
        
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        
        do {
            let jeu = Jeu(id: produit.id, titre: produit.titre, prix: prix, description: produit.description, image: produit.image, quantiteEnStock: produit.quantiteEnStock, quantiteMinStock: produit.quantiteMinStock, auteurs: auteurs, collection: collection)
            let jsonData = try JSONEncoder().encode(jeu)
            request.httpBody = jsonData
        } catch let jsonErr {
            print(jsonErr)
            
            return
        }
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Error took place \(error)")
                
                return
            }
            
            guard let data = data else {
                
                return
            }
            
            do {
                let jeuResponse = try JSONDecoder().decode(Jeu.self, from: data)
                print("Response data:\n\(jeuResponse)")
                completion(jeuResponse) //Retourner Livre
            } catch let jsonErr {
                print(jsonErr)
                
            }
        }
        task.resume()
    }
    
    func postFilm(product: ProduitResponse,prix:Double, acteurs: String, realisteur: String, format:String, videoExtrait: String, categorie: String, completion: @escaping (Film) -> ()) {
        let url = URL(string: "http://localhost:1000/api/films/")
        guard let requestUrl = url else { fatalError() }
        
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
        
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        
        do {
            let film = Film(id: product.id, titre: product.titre, prix: prix, description: product.description, image: product.image, quantiteEnStock: product.quantiteEnStock, quantiteMinStock: product.quantiteMinStock, acteurs: acteurs, realisateur: realisteur, format: format, videoExtrait: videoExtrait, categories: categorie)
            let jsonData = try JSONEncoder().encode(film)
            request.httpBody = jsonData
        } catch let jsonErr {
            print(jsonErr)
            
            return
        }
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Error took place \(error)")
                
                return
            }
            
            guard let data = data else {
                
                return
            }
            
            do {
                let filmResponse = try JSONDecoder().decode(Film.self, from: data)
                print("Response data:\n\(filmResponse)")
                completion(filmResponse) //Retourner Livre
            } catch let jsonErr {
                print(jsonErr)
                
            }
        }
        task.resume()
    }
    
    func getProduct(id: Int, completion:@escaping (ProduitResponse) -> ()) {
        guard let url = URL(string: "http://localhost:1000/api/produits/\(id)") else { return }
        
        do{
            URLSession.shared.dataTask(with: url) {(data, _,_) in
                let produit = try? JSONDecoder().decode(ProduitResponse.self, from: data!)
                print(produit)
                
                let produitNull = ProduitResponse(id: 0, titre: "non trouvé", prix: 0.0, description: "non trouvé", image: "non trouvé", quantiteEnStock: 0, quantiteMinStock: 0)
                DispatchQueue.main.async {
                    completion(produit ?? produitNull)
                }
            }
            .resume()
        } catch  let error{
            print("erreur : \(error.localizedDescription)")
        }
        
    }
    
    
    
    func updateProduct(id:Int,produit: Product, qte:Int) {
        let url = URL(string: "http://localhost:1000/api/produits/\(id)")
        guard let requestUrl = url else { fatalError() }
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "PUT"
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        do {
            let updatedProduct = Product(titre: produit.titre, prix: produit.prix, description: produit.description, image: produit.image, quantiteEnStock: produit.quantiteEnStock + qte, quantiteMinStock: produit.quantiteMinStock)
            let jsonData = try JSONEncoder().encode(updatedProduct)
            request.httpBody = jsonData
        }catch let jsonErr {
            print(jsonErr)
            return
        }
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Error took place \(error)")
                return
            }
            guard let data = data else { return }
            do{
                let productItemModel = try JSONDecoder().decode(ProduitResponse.self, from: data)
                print("Response data : data \n \(productItemModel)")
                print("productItemModel description \n \(productItemModel.description)")
                print("Response id :  \n \(productItemModel.id)")
            }catch let jsonErr {
                print(jsonErr)
            }
        }
        task.resume()
    }
    
    func updateFilm(id:Int,produit: ProduitResponse, qte:Int) {
        let url = URL(string: "http://localhost:1000/api/films/\(id)")
        guard let requestUrl = url else { fatalError() }
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "PUT"
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        do {
            let updatedProduct = Product(titre: produit.titre, prix: produit.prix, description: produit.description, image: produit.image, quantiteEnStock: produit.quantiteEnStock + qte, quantiteMinStock: produit.quantiteMinStock)
            let jsonData = try JSONEncoder().encode(updatedProduct)
            request.httpBody = jsonData
        }catch let jsonErr {
            print(jsonErr)
            return
        }
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Error took place \(error)")
                return
            }
            guard let data = data else { return }
            do{
                let productItemModel = try JSONDecoder().decode(Film.self, from: data)
                print("Response data : data \n \(productItemModel)")
                print("productItemModel description \n \(productItemModel.description)")
                print("Response id :  \n \(productItemModel.id)")
            }catch let jsonErr {
                print(jsonErr)
            }
        }
        task.resume()
    }
    func updateJeux(id:Int,produit: ProduitResponse, qte:Int) {
        let url = URL(string: "http://localhost:1000/api/jeux/\(id)")
        guard let requestUrl = url else { fatalError() }
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "PUT"
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        do {
            let updatedProduct = Product(titre: produit.titre, prix: produit.prix, description: produit.description, image: produit.image, quantiteEnStock: produit.quantiteEnStock + qte, quantiteMinStock: produit.quantiteMinStock)
            let jsonData = try JSONEncoder().encode(updatedProduct)
            request.httpBody = jsonData
        }catch let jsonErr {
            print(jsonErr)
            return
        }
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Error took place \(error)")
                return
            }
            guard let data = data else { return }
            do{
                let productItemModel = try JSONDecoder().decode(Jeu.self, from: data)
                print("Response data : data \n \(productItemModel)")
                print("productItemModel description \n \(productItemModel.description)")
                print("Response id :  \n \(productItemModel.id)")
            }catch let jsonErr {
                print(jsonErr)
            }
        }
        task.resume()
    }
    func updateLivre(id:Int,produit: ProduitResponse, qte:Int) {
        let url = URL(string: "http://localhost:1000/api/livres/\(id)")
        guard let requestUrl = url else { fatalError() }
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "PUT"
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        do {
            let updatedProduct = Product(titre: produit.titre, prix: produit.prix, description: produit.description, image: produit.image, quantiteEnStock: produit.quantiteEnStock + qte, quantiteMinStock: produit.quantiteMinStock)
            let jsonData = try JSONEncoder().encode(updatedProduct)
            request.httpBody = jsonData
        }catch let jsonErr {
            print(jsonErr)
            return
        }
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Error took place \(error)")
                return
            }
            guard let data = data else { return }
            do{
                let productItemModel = try JSONDecoder().decode(Livre.self, from: data)
                print("Response data : data \n \(productItemModel)")
                print("productItemModel description \n \(productItemModel.description)")
                print("Response id :  \n \(productItemModel.id)")
            }catch let jsonErr {
                print(jsonErr)
            }
        }
        task.resume()
    }
    
    func soustraireProduct(id:Int) {
        let url = URL(string: "http://localhost:1000/api/produits/diminuer/\(id)")
        guard let requestUrl = url else { fatalError() }
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "PUT"
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
//        do {
//            print("Quantité : \(produit.quantiteEnStock)")
//            let updatedProduct = Product(titre: produit.titre, prix: produit.prix, description: produit.description, image: produit.image, quantiteEnStock: produit.quantiteEnStock - 1, quantiteMinStock: produit.quantiteMinStock)
//            let jsonData = try JSONEncoder().encode(updatedProduct)
//            request.httpBody = jsonData
//        }catch let jsonErr {
//            print(jsonErr)
//            return
//        }
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Error took place \(error)")
                return
            }
            guard let data = data else { return }
            do{
                let productItemModel = try JSONDecoder().decode(ProduitResponse.self, from: data)
                print("Response data : data \n \(productItemModel)")
                print("productItemModel description \n \(productItemModel.description)")
                print("Response id :  \n \(productItemModel.id)")
            }catch let jsonErr {
                print(jsonErr)
            }
        }
        task.resume()
    }
}
