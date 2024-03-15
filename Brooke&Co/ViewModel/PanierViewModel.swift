//
//  PanierViewModel.swift
//  Brooke&Co
//
//  Created by Charlie Leduc on 2023-12-06.
//

import Foundation

class PanierViewModel {
    func postItem(idClient: Int, idProduit:Int, imageProduit: String, titreProduit: String, prixProduit: Double) {
        let url = URL(string: "http://localhost:1000/api/panier/")
        guard let requestUrl = url else { fatalError() }

   

        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"

 
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        do {
            let newItem = ItemPanier(idClient: idClient, idProduit: idProduit, imageProduit: imageProduit, titreProduit: titreProduit, prixProduit: prixProduit)
            let jsonData = try JSONEncoder().encode(newItem)
            request.httpBody = jsonData
        }catch let jsonErr {
            print(jsonErr)
        }
        
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Error took place \(error)")
                return
            }
            
            guard let data = data else { return }
            
            do{
                let itemModel = try JSONDecoder().decode(ItemResponse.self, from: data)
                print("Response data : data \n \(itemModel)")
                print("productItemModel description \n \(itemModel.id)")
                print("Response id :  \n \(itemModel.idClient)")
            }catch let jsonErr {
                print(jsonErr)
            }
            
            
        }
        task.resume()
    }
    
    
    func getItemsDuClient (idClient: Int, completion:@escaping ([ItemResponse]) -> ()) {
        guard let url = URL(string: "http://localhost:1000/api/panier/\(idClient)") else { return }

        URLSession.shared.dataTask(with: url) {(data, _,_) in
            let items = try! JSONDecoder().decode([ItemResponse].self, from: data!)
            print(items)
            DispatchQueue.main.async {
                completion(items)
            }
        }
        .resume()
    }
    
    func getTotalDuClient (id: Int, completion:@escaping (Double) -> ()) {
        guard let url = URL(string: "http://localhost:1000/api/panier/total/\(id)") else { return }
        
        URLSession.shared.dataTask(with: url) {(data, _,_) in
            let prix = try! JSONDecoder().decode(Double.self, from: data!)
            print(prix)
            DispatchQueue.main.async {
                completion(prix)
            }
        }
        .resume()
    }
    func getNombreDuClient (idClient: Int, completion:@escaping (Int) -> ()) {
        guard let url = URL(string: "http://localhost:1000/api/panier/nombre/\(idClient)") else { return }

        URLSession.shared.dataTask(with: url) {(data, _,_) in
            let count = try! JSONDecoder().decode(Int.self, from: data!)
//            print(count)
            DispatchQueue.main.async {
                completion(count)
            }
        }
        .resume()
    }
    
//    func getTotalDuClient (id: Int, completion:@escaping (Double) -> ()) {
//        guard let url = URL(string: "http://localhost:1000/api/panier/total/\(id)") else { return }
//        
//        URLSession.shared.dataTask(with: url) {(data, _,_) in
//            let prix = try! JSONDecoder().decode(Double.self, from: data!)
//            print(prix)
//            DispatchQueue.main.async {
//                completion(prix)
//            }
//        }
//        .resume()
//    }
    
    func deleteAll() {
        
        let url = URL(string: "http://localhost:1000/api/panier/")
        guard let requestUrl = url else { fatalError() }
        
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "DELETE"
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Error took place \(error)")
                return
            }
            
//            guard let data = data else { return }
//
//            do{
//                let productItemModel = try JSONDecoder().decode(ProductReponseModel.self, from: data)
//                print("Response data : data \n \(productItemModel)")
//                print("productItemModel description \n \(productItemModel.description)")
//                print("Response id :  \n \(productItemModel.id)")
//            }catch let jsonErr {
//                print(jsonErr)
//            }
            
            
        }
        task.resume()
    }
}
