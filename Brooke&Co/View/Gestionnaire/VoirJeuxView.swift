//
//  VoirJeuxView.swift
//  Brooke&Co
//
//  Created by Guilherme Cintra Castro on 2023-11-07.
//

import SwiftUI

struct VoirJeuxView: View {
    let game : Jeu
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack {
            
            // MARK: - HEADER
            
            HStack {
                Button(action: {
                    dismiss()
                }, label: {
                    Image(systemName: "arrowshape.backward.fill")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.black)
                })
               
                
                Image("Logo")
                    .padding(.bottom, 50)
                    .padding(.horizontal,20)
            }
            
            
            
            
            
            
            
            // MARK: - PRODUIT
            
            Image("\(game.image.lowercased())")
                .resizable()
                .scaledToFill()
                .frame(width: 300, height: 300)
                .cornerRadius(20)
            
            VStack (alignment: .center, spacing: 2){
                Text("\(game.titre)")
                    .font(.largeTitle)
                    .bold()
                Text("\(game.description)")
                    .bold()
                    .padding()
                    .multilineTextAlignment(.center)
                    .font(.headline)
                
                
                Text("Auteur :\(game.auteurs)")
                    .bold()
                    .multilineTextAlignment(.center)
                    .font(.headline)
                
                Text("Collection :\(game.auteurs)")
                    .bold()
                    .multilineTextAlignment(.center)
                    .font(.headline)
                
                Text("Prix : \(String(format: "%.2f", game.prix)) $")
                    .bold()
                    .multilineTextAlignment(.center)
                    .font(.headline)
            }
            
           
            Spacer()
            
        }
        .frame(maxWidth: .infinity)
        .background(LinearGradient(colors: [customBlueLighter, customBlueDarker], startPoint: .top, endPoint: .bottom))
            .frame(maxWidth: .infinity)
            .navigationBarBackButtonHidden(true)
    }
}

//#Preview {
//    VoirJeuxView(game: Game(id: 2, titre: "yih", prix:20.0, description: "edbhwjqskn", image: "game", quantiteEnStock: 2, quantiteMin: 1, author: "dhbsjakn", collection: "dwjnsk"))
//}
//struct VoirJeuxView_Previews: PreviewProvider {
//    static var previews: some View {
//        VoirJeuxView(game: Game(id: 2, titre: "yih", prix:20.0, description: "edbhwjqskn", image: "game", quantiteEnStock: 2, quantiteMin: 1, author: "dhbsjakn", collection: "dwjnsk"))
//    }
//}
