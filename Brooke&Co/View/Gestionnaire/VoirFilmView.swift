//
//  VoirFilmView.swift
//  Brooke&Co
//
//  Created by Guilherme Cintra Castro on 2023-11-07.
//

import SwiftUI

struct VoirFilmView: View {
    var movie: Film
    @State var cartClick = false
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack {
            
            
            
            VStack{
                
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
                
                Image("\(movie.image.lowercased())")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                 
                
                VStack (alignment: .center, spacing: 2){
                    Text("\(movie.titre)")
                        .font(.largeTitle)
                        .bold()
                    Text("\(movie.description)")
                        .bold()
                        .padding()
                        .multilineTextAlignment(.center)
                        .font(.headline)
                    
                        HStack {
                            Text("Acteurs :\(movie.acteurs) ")
                                .bold()
                            
                        }
                    
                    
                    Text("\(movie.format)")
                        .bold()
                        .multilineTextAlignment(.center)
                        .font(.headline)
                    
                    
                    Text("Prix : \(String(format: "%.2f", movie.prix)) $")
                        .bold()
                        .multilineTextAlignment(.center)
                        .font(.headline)
                }
                
              
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .background(LinearGradient(colors: [customBlueLighter, customBlueDarker], startPoint: .top, endPoint: .bottom))
             
            .navigationBarBackButtonHidden(true)
        }
    }
}

//#Preview {
//    VoirFilmView(movie: Movie(id: 2, titre: "he", prix: 20.0, description: "uhbjkn", image: "harry", quantiteEnStock: 20, quantiteMin: 10, acteurs: ["hello, World, bye"], realisateur: "siyguahjk", format: "dvd", extraitVideo: "h", categorie: "film"))
//}
struct VoirFilmView_Previews: PreviewProvider {
    static var previews: some View {
        VoirFilmView(movie: Film(id: 1, titre: "uygbhijkn", prix: 20.00, description: "uvghbjk", image: "game", quantiteEnStock: 20, quantiteMinStock: 10, acteurs: "ibhjnkihbnk iuhjk", realisateur: "uhbnjk", format: "DVD", videoExtrait: "hbjnk", categories: "Drame"))
    }
}
