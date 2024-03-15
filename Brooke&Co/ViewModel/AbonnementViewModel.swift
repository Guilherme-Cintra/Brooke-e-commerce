//
//  AbonnementViewModel.swift
//  Brooke&Co
//
//  Created by Charlie Leduc on 2023-12-12.
//

import Foundation

class AbonnementViewModel{
    func createAbonnement(id: Int) {
        let url = URL(string: "http://localhost:1000/api/abonnements/")
        guard let requestUrl = url else { fatalError() }
        
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
        
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let currentDate = Date()
        let dateString = dateFormatter.string(from: currentDate)
        
        let oneYearLater = Calendar.current.date(byAdding: .year, value: 1, to: currentDate)
        let dateFinString = dateFormatter.string(from: oneYearLater!)
        do {
            let abonnement = Abonnement(idClient: id, dateDebut: dateString, dateFin: dateFinString)
            let jsonData = try JSONEncoder().encode(abonnement)
            request.httpBody = jsonData
        } catch let jsonErr {
            print(jsonErr)
            return
        }
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
//            if let error = error {
//                print("Error took place \(error)")
//                
//                return
//            }
//            
//            guard let data = data else {
//                
//                return
//            }
//            
//            do {
//                let approvisionnementResponse = try JSONDecoder().decode(ApprovisionnementReponse.self, from: data)
//                print("Response data:\n\(approvisionnementResponse)")
//                completion(approvisionnementResponse) //Retourner Livre
//            } catch let jsonErr {
//                print(jsonErr)
//            }
        }
        task.resume()
    }
    
    
    func getAbonnement (id: Int, completion:@escaping (Abonnement) -> ()) {
        guard let url = URL(string: "http://localhost:1000/api/abonnements/\(id)") else { return }

        URLSession.shared.dataTask(with: url) {(data, _,_) in
            let abonnement = try? JSONDecoder().decode(Abonnement.self, from: data!)
            let abonnementnul = Abonnement(idClient: 0, dateDebut: "", dateFin: "")
            print(abonnement)
            DispatchQueue.main.async {
                completion(abonnement ?? abonnementnul)
            }
        }
        .resume()
    }
    
    func payerAbonnementt(id: Int) {

            let url = URL(string: "http://localhost:1000/api/abonnements/\(id)")


            guard let requestUrl = url else { fatalError() }

            var request = URLRequest(url: requestUrl)
            request.httpMethod = "PUT"


            request.setValue("application/json", forHTTPHeaderField: "Accept")
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")



            

            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                

            }
            task.resume()
        }
}
