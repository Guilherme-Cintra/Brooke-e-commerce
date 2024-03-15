//
//  LivreViewModel.swift
//  Brooke&Co
//
//  Created by Charlie Leduc on 2023-12-04.
//

import Foundation


class LivreViewModel {
    func getLivresInfo (completion:@escaping ([Livre]) -> ()) {
        guard let url = URL(string: "http://localhost:1000/api/livres/info") else { return }

        URLSession.shared.dataTask(with: url) {(data, _,_) in
            let livres = try! JSONDecoder().decode([Livre].self, from: data!)
            print(livres)
            DispatchQueue.main.async {
                completion(livres)
            }
        }
        .resume()
    }
    
    func getLivresGeo(completion:@escaping ([Livre]) -> ()) {
        guard let url = URL(string: "http://localhost:1000/api/livres/geo") else { return }

        URLSession.shared.dataTask(with: url) {(data, _,_) in
            let livres = try! JSONDecoder().decode([Livre].self, from: data!)
            print(livres)

            DispatchQueue.main.async {
                completion(livres)
            }
        }
        .resume()
    }
    
    func getLesLitterature(completion:@escaping ([Livre]) -> ()) {
        guard let url = URL(string: "http://localhost:1000/api/livres/litterature") else { return }

        URLSession.shared.dataTask(with: url) {(data, _,_) in
            let livres = try! JSONDecoder().decode([Livre].self, from: data!)
            print(livres)

            DispatchQueue.main.async {
                completion(livres)
            }
        }
        .resume()
    }
    
  
}
