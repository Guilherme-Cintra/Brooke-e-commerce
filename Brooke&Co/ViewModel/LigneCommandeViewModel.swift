//
//  LigneCommandeViewModel.swift
//  Brooke&Co
//
//  Created by Charlie Leduc on 2023-12-06.
//

import Foundation

class LigneCommandeViewModel {
    func postLigneCommande(numCommande: Int, idProduit: Int, quantite:Int, prixReel: Double) {
        let url = URL(string: "http://localhost:1000/api/ligneCommandes/")
        guard let requestUrl = url else { fatalError() }

   

        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"

 
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        do {
            let newLigneCommande = LigneCommande(idProduit: idProduit, numeroCommande: numCommande, quantite: quantite, prixReel: prixReel)
            let jsonData = try JSONEncoder().encode(newLigneCommande)
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
                let lcModel = try JSONDecoder().decode(LigneCommande.self, from: data)
                print("Response data : data \n \(lcModel)")
                print("numéro de la commande \n \(lcModel.numeroCommande)")
                print("Response id du client:  \n \(lcModel.idProduit)")
            }catch let jsonErr {
                print(jsonErr)
            }
            
            
        }
        task.resume()
    }
}
