//
//  JeuViewModel.swift
//  Brooke&Co
//
//  Created by Charlie Leduc on 2023-12-04.
//

import Foundation

class JeuxViewModel {
    func getJeuxPS(completion:@escaping ([Jeu]) -> ()) {
        guard let url = URL(string: "http://localhost:1000/api/jeux/ps") else { return }

        URLSession.shared.dataTask(with: url) {(data, _,_) in
            let jeux = try! JSONDecoder().decode([Jeu].self, from: data!)
            print(jeux)

            DispatchQueue.main.async {
                completion(jeux)
            }
        }
        .resume()
    }
    
    func getJeuxXbox(completion:@escaping ([Jeu]) -> ()) {
        guard let url = URL(string: "http://localhost:1000/api/jeux/xbox") else { return }

        URLSession.shared.dataTask(with: url) {(data, _,_) in
            let jeux = try! JSONDecoder().decode([Jeu].self, from: data!)
            print(jeux)

            DispatchQueue.main.async {
                completion(jeux)
            }
        }
        .resume()
    }
    
    func getJeuxWI(completion:@escaping ([Jeu]) -> ()) {
        guard let url = URL(string: "http://localhost:1000/api/jeux/wi") else { return }

        URLSession.shared.dataTask(with: url) {(data, _,_) in
            let jeux = try! JSONDecoder().decode([Jeu].self, from: data!)
            print(jeux)

            DispatchQueue.main.async {
                completion(jeux)
            }
        }
        .resume()
    }
    
  
}
