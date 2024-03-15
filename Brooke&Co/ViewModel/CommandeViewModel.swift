//
//  CommandeViewModel.swift
//  Brooke&Co
//
//  Created by Charlie Leduc on 2023-12-06.
//

import Foundation

class CommandeViewModel {
    func getCommandes (completion:@escaping ([CommandeResponse]) -> ()) {
        guard let url = URL(string: "http://localhost:1000/api/commandes/") else { return }

        URLSession.shared.dataTask(with: url) {(data, _,_) in
            let commandes = try! JSONDecoder().decode([CommandeResponse].self, from: data!)
            print(commandes)
            DispatchQueue.main.async {
                completion(commandes)
            }
        }
        .resume()
    }
    
    func postCommande(idClient: Int, completion:@escaping (CommandeResponse) -> ()) {
        let url = URL(string: "http://localhost:1000/api/commandes/")
        guard let requestUrl = url else { fatalError() }

   

        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"

        let currentDate = Date()

        let dateString = dateFormatter.string(from: currentDate)
 
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        do {
            let newCommande = CommandeBody(date: dateString, idClient: idClient, etat: "payé")
            let jsonData = try JSONEncoder().encode(newCommande)
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
                let commandeModel = try JSONDecoder().decode(CommandeResponse.self, from: data)
                print("Response data : data \n \(commandeModel)")
                print("numéro de la commande \n \(commandeModel.numero)")
                print("Response id du client:  \n \(commandeModel.idClient)")
                completion(commandeModel)
            }catch let jsonErr {
                print(jsonErr)
            }
            
            
        }
        task.resume()
    }
    
    func expedierCommande(commande: CommandeResponse) {
        let url = URL(string: "http://localhost:1000/api/commandes/\(commande.numero)")
        guard let requestUrl = url else { fatalError() }
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "PUT"
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        do {
            let updatedCommande = CommandeBody(date: commande.date, idClient: commande.idClient, etat: "Expédié")
            let jsonData = try JSONEncoder().encode(updatedCommande)
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
                let productItemModel = try JSONDecoder().decode(CommandeResponse.self, from: data)
                print("Response data : data \n \(productItemModel)")
                print("productItemModel description \n \(productItemModel.etat)")
                print("Response id :  \n \(productItemModel.numero)")
            }catch let jsonErr {
                print(jsonErr)
            }
        }
        task.resume()
    }
    
}
