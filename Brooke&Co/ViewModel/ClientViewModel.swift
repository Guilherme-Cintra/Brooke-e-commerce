//
//  UserViewModel.swift
//  Brooke&Co
//
//  Created by Guilherme Cintra Castro on 2023-12-01.
//

import Foundation

class ClientViewModel {
    func loginUser(courriel: String, password: String, completion: @escaping (Client?) -> (), onError: @escaping (String) -> ()) {
        guard let url = URL(string: "http://localhost:1000/api/clients/\(courriel)/\(password)") else {
            onError("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                DispatchQueue.main.async {
                    onError("Network error: \(error.localizedDescription)")
                }
                return
            }
            guard let data = data, let client = try? JSONDecoder().decode(Client.self, from: data) else {
                DispatchQueue.main.async {
                    onError("Utilisateur non trouvé")
                }
                return
            }
            DispatchQueue.main.async {
                completion(client)
            }
        }.resume()
    }
    
    
    func updateClient(id: Int, nom: String, prenom: String, courriel: String, motDePasse: String) {

            let url = URL(string: "http://localhost:1000/api/clients/\(id)")


            guard let requestUrl = url else { fatalError() }

            var request = URLRequest(url: requestUrl)
            request.httpMethod = "PUT"


            request.setValue("application/json", forHTTPHeaderField: "Accept")
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")



            do {
                let updatedClient = Client(id: id, nom: nom.lowercased(), prenom: prenom.lowercased(), courriel: courriel.lowercased(), password: motDePasse)
                let jsonData = try JSONEncoder().encode(updatedClient)
                request.httpBody = jsonData
            }catch let jsonErr {
                print(jsonErr)
                return
            }

            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                if let error = error {
                    print("Error took place \(error) line 64 : ClientVM")
                    return
                }

                guard let data = data else { return }

                do{
                    let client = try JSONDecoder().decode(Client.self, from: data)
                    print("Response data : data \n \(client)")
                    print("productItemModel description \n \(client.courriel)")
                    print("Response id :  \n \(client.id)")
                }catch let jsonErr {
                    print(jsonErr)
                }


            }
            task.resume()
        }
    
    func registerUser(nom: String, prenom:String,courriel:String, password: String, completion:  @escaping (Client?) -> (), onError: @escaping (String) -> ()){
        let url = URL(string: "http://localhost:1000/api/clients/")
        guard let requestUrl = url else { fatalError()}
        
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
        
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
         let newUser = ClientBody(nom: nom.lowercased(), prenom: prenom.lowercased(), courriel: courriel.lowercased(), password: password.lowercased())
            let jsonData = try JSONEncoder().encode(newUser)
            request.httpBody = jsonData
        } catch let jsonErr{
            print(jsonErr)
        }
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                DispatchQueue.main.async {
                    onError("Network error: \(error.localizedDescription)")
                }
                return
            }

            guard let data = data, let client = try? JSONDecoder().decode(Client.self, from: data) else {
                DispatchQueue.main.async {
                    onError("Utilisateur non trouvé")
                }
                return
            }

            DispatchQueue.main.async {
                completion(client)
            }
           }
           task.resume()
    }
    
    
    func getClient(id: Int, completion:@escaping (Client) -> ()) {
           guard let url = URL(string: "http://localhost:1000/api/clients/\(id)") else { return }
   
           URLSession.shared.dataTask(with: url) {(data, _,_) in
               let client = try! JSONDecoder().decode(Client.self, from: data!)
               print(client)
   
               DispatchQueue.main.async {
                   completion(client)
               }
           }
           .resume()
       }
    
}




//class apiProductCall {
//    func getProducts(completion:@escaping ([Product]) -> ()) {
//        guard let url = URL(string: "http://localhost:3000/api/products/") else { return }
//
//        URLSession.shared.dataTask(with: url) {(data, _,_) in
//            let products = try! JSONDecoder().decode([Product].self, from: data!)
//            print(products)
//
//            DispatchQueue.main.async {
//                completion(products)
//            }
//        }
//        .resume()
//    }
//
//    func getProductById(id: Int, completion: @escaping (Product?) -> ()) {
//        guard let url = URL(string: "http://localhost:3000/api/products/\(id)") else { return }
//
//        URLSession.shared.dataTask(with: url) {(data, _,_) in
//            let product = try? JSONDecoder().decode(Product.self, from: data!)
//            print(product)
//
//            DispatchQueue.main.async {
//                completion(product)
//            }
//        }
//        .resume()
//    }
//
//
//    func postPoduct(id: Int, description: String, image: String, prix: String, details: String) {
//        let url = URL(string: "http://localhost:3000/api/products/")
//        guard let requestUrl = url else { fatalError() }
//
//
//
//        var request = URLRequest(url: requestUrl)
//        request.httpMethod = "POST"
//
//
//        request.setValue("application/json", forHTTPHeaderField: "Accept")
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//
//        do {
//            let newProductItem = Product(id: id, description: description.lowercased(), image: image.lowercased(), prix: prix, details: details.lowercased())
//            let jsonData = try JSONEncoder().encode(newProductItem)
//            request.httpBody = jsonData
//        }catch let jsonErr {
//            print(jsonErr)
//        }
//
//
//        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
//            if let error = error {
//                print("Error took place \(error)")
//                return
//            }
//
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
//
//
//        }
//        task.resume()
//    }
//
//    func updateProduct(id: Int, description: String, image: String, prix: String, details: String) {
//
//        let url = URL(string: "http://localhost:3000/api/products/\(id)")
//
//
//        guard let requestUrl = url else { fatalError() }
//
//        var request = URLRequest(url: requestUrl)
//        request.httpMethod = "PUT"
//
//
//        request.setValue("application/json", forHTTPHeaderField: "Accept")
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//
//
//
//        do {
//            let updatedProduct = Product(id: id, description: description.lowercased(), image: image.lowercased(), prix: prix, details: details.lowercased())
//            let jsonData = try JSONEncoder().encode(updatedProduct)
//            request.httpBody = jsonData
//        }catch let jsonErr {
//            print(jsonErr)
//            return
//        }
//
//        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
//            if let error = error {
//                print("Error took place \(error)")
//                return
//            }
//
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
//
//
//        }
//        task.resume()
//
//
//    }
//
//    func deleteProduct(id: Int) {
//
//        let url = URL(string: "http://localhost:3000/api/products/\(id)")
//        guard let requestUrl = url else { fatalError() }
//
//        var request = URLRequest(url: requestUrl)
//        request.httpMethod = "DELETE"
//
//        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
//            if let error = error {
//                print("Error took place \(error)")
//                return
//            }
//
////            guard let data = data else { return }
////
////            do{
////                let productItemModel = try JSONDecoder().decode(ProductReponseModel.self, from: data)
////                print("Response data : data \n \(productItemModel)")
////                print("productItemModel description \n \(productItemModel.description)")
////                print("Response id :  \n \(productItemModel.id)")
////            }catch let jsonErr {
////                print(jsonErr)
////            }
//
//
//        }
//        task.resume()
//    }
//}

