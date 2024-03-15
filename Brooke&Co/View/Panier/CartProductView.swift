//
//  CartProductView.swift
//  Brooke&Co
//
//  Created by Guilherme Cintra Castro on 2023-11-05.
//

import SwiftUI

struct CartProductView: View {
    @State var quantite = 1.0
    
    var produit : ItemResponse
    var body: some View {
        VStack {
            
            HStack {
                Image("\(produit.imageProduit)")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 200, maxHeight: 200)
                VStack(alignment: .leading, spacing: 20) {
                    Text("\(produit.titreProduit)")
                        .bold()
                        .foregroundColor(.white)
                    
                    Text("Prix : \(String(format: "%.2f", produit.prixProduit)) $")
                        .foregroundColor(.white)
                        .bold()
                    VStack {
//                        Image(systemName: "trash")
//                            .foregroundColor(.white)
//                            .padding()
//                            .onTapGesture {
//                                
//                            }
                        
                    }
                    
                    
                }
            }
        }
        .padding()
        .background(darkestBlue)
        .cornerRadius(30)
        .overlay(
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(Color.gray, lineWidth: 1)
                )
                .shadow(color: .gray, radius: 5, x: 0, y: 2)
    }
}

struct CartProductView_Previews: PreviewProvider {
    static var previews: some View {
        CartProductView(produit: ItemResponse(id: 1, idClient: 1, idProduit: 1, imageProduit: "game", titreProduit: "blablabl", prixProduit: 20.00))
    }
}
