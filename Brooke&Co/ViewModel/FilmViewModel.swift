//
//  FilmViewModel.swift
//  Brooke&Co
//
//  Created by Charlie Leduc on 2023-12-04.
//

import Foundation
class fimViewModel {
    func getFilmsDrame(completion:@escaping ([Film]) -> ()) {
        guard let url = URL(string: "http://localhost:1000/api/films/drame") else { return }

        URLSession.shared.dataTask(with: url) {(data, _,_) in
            let movies = try! JSONDecoder().decode([Film].self, from: data!)
            print(movies)

            DispatchQueue.main.async {
                completion(movies)
            }
        }
        .resume()
    } 
    
    func getFilmsSciences(completion:@escaping ([Film]) -> ()) {
        guard let url = URL(string: "http://localhost:1000/api/films/sciences") else { return }

        URLSession.shared.dataTask(with: url) {(data, _,_) in
            let movies = try! JSONDecoder().decode([Film].self, from: data!)
            print(movies)

            DispatchQueue.main.async {
                completion(movies)
            }
        }
        .resume()
    } 
    
    func getFilmsAction(completion:@escaping ([Film]) -> ()) {
        guard let url = URL(string: "http://localhost:1000/api/films/action") else { return }

        URLSession.shared.dataTask(with: url) {(data, _,_) in
            let movies = try! JSONDecoder().decode([Film].self, from: data!)
            print(movies)

            DispatchQueue.main.async {
                completion(movies)
            }
        }
        .resume()
    }
    
    func getFilmsComedie(completion:@escaping ([Film]) -> ()) {
        guard let url = URL(string: "http://localhost:1000/api/films/comedie") else { return }

        URLSession.shared.dataTask(with: url) {(data, _,_) in
            let movies = try! JSONDecoder().decode([Film].self, from: data!)
            print(movies)

            DispatchQueue.main.async {
                completion(movies)
            }
        }
        .resume()
    }
}
