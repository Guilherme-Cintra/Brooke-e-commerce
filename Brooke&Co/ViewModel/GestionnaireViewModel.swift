//
//  GestionnaireViewModel.swift
//  Brooke&Co
//
//  Created by Guilherne Cintra Castro on 2023-12-03.
//

import Foundation
class GestionnaireViewModel {
    func loginGestionnaire(courriel: String, password: String, completion: @escaping (Gestionnaire?) -> (), onError: @escaping (String) -> ()) {
        guard let url = URL(string: "http://localhost:1000/api/gestionnaires/\(courriel)/\(password)") else {
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
            guard let data = data, let gestionnaire = try? JSONDecoder().decode(Gestionnaire.self, from: data) else {
                DispatchQueue.main.async {
                    onError("Gestionnaire non trouvé")
                }
                return
            }
            DispatchQueue.main.async {
                completion(gestionnaire)
            }
        }.resume()
    }
}
