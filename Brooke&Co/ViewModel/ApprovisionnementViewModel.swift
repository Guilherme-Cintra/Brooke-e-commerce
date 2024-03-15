//
//  ApprovisionnementViewModel.swift
//  Brooke&Co
//
//  Created by Charlie Leduc on 2023-12-12.
//

import Foundation

class ApprovisionnementViewModel{
    
    func createApprovisionnement( completion: @escaping (ApprovisionnementReponse) -> ()) {
        let url = URL(string: "http://localhost:1000/api/approvisionnements/")
        guard let requestUrl = url else { fatalError() }
        
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
        
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let currentDate = Date()
        let dateString = dateFormatter.string(from: currentDate)
        do {
            let approvisionnement = Approvisionnement(date: dateString, idFournisseur: 1, etat: "livré")
            let jsonData = try JSONEncoder().encode(approvisionnement)
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
                let approvisionnementResponse = try JSONDecoder().decode(ApprovisionnementReponse.self, from: data)
                print("Response data:\n\(approvisionnementResponse)")
                completion(approvisionnementResponse) //Retourner Livre
            } catch let jsonErr {
                print(jsonErr)
            }
        }
        task.resume()
    }
    
    func createProduitApprovisionne(idProduit: Int,approvisionnement: ApprovisionnementReponse, quantite:Int, prixReel:Double) {
        let url = URL(string: "http://localhost:1000/api/produitApprovisionnes/")
        guard let requestUrl = url else { fatalError() }
        
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
        
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let produitApprovisione = ProduitApprovisionnee(idProduit: idProduit, numeroApprovisionnement: approvisionnement.numero, quantite: quantite, prixReel: prixReel)
            let jsonData = try JSONEncoder().encode(produitApprovisione)
            request.httpBody = jsonData
        } catch let jsonErr {
            print(jsonErr)
            return
        }
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            //        if let error = error {
            //            print("Error took place \(error)")
            //
            //            return
            //        }
            //
            //        guard let data = data else {
            //
            //            return
            //        }
            //
            //        do {
            //            let approvisionnementResponse = try JSONDecoder().decode(ApprovisionnementReponse.self, from: data)
            //            print("Response data:\n\(approvisionnementResponse)")
            //            completion(approvisionnementResponse) //Retourner Livre
            //        } catch let jsonErr {
            //            print(jsonErr)
            //        }
        }
        task.resume()
    }
}
