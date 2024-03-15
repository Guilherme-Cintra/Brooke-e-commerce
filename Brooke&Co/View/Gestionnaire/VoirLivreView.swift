//
//  VoirLivreView.swift
//  Brooke&Co
//
//  Created by Guilherme Cintra Castro on 2023-11-07.
//

import SwiftUI

struct VoirLivreView: View {
    @State private var showSnackbar: Bool = false
    var livre : Livre
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
            
            Image("\(livre.image.lowercased())")
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 300)
             
            
            VStack (alignment: .center, spacing: 2){
                Text("\(livre.titre)")
                    .font(.largeTitle)
                    .bold()
                Text("\(livre.description)")
                    .bold()
                    .padding()
                    .multilineTextAlignment(.center)
                    .font(.headline)
                Text("\(livre.auteurs)")
                    .bold()
                    .multilineTextAlignment(.center)
                    .font(.headline)
                Text("Prix : \(String(format: "%.2f", livre.prix)) $")
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

//#Preview {
//    VoirLivreView(livre: Book(id: 1, titre: "trfedw", prix: 20.0, description: "rfsewd s dsd das", image: "harry", quantiteEnStock: 23, quantiteMin: 21, isbn: "24321", dateParution: Date(), editeur: "rfen", auteur: "hejnw", categories: "Science Fiction"))
//}

//struct VoirLivreView_Previews: PreviewProvider {
//    static var previews: some View {
//        VoirLivreView(livre: Book(id: 1, titre: "trfedw", prix: 20.0, description: "rfsewd s dsd das", image: "harry", quantiteEnStock: 23, quantiteMin: 21, isbn: "24321", dateParution: Date(), editeur: "rfen", auteur: "hejnw", categories: "Science Fiction"))
//    }
//}
