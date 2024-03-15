//
//  AfficherStockView.swift
//  ProjectInterfaces
//
//  Created by Rafael Castro on 2023-11-06.
//

import SwiftUI

struct AfficherStockView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State private var titre : String = ""
    @State private var idProduit: String = ""
    @State private var quantiteStock: Int = 0
    @State private var quantiteMinStock: Int = 0
    @State private var produitChoisi: Product? = nil
    
    var body: some View {
        VStack {
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
            //            .padding(.top, 40)
            
            .padding(.horizontal, 30)
            
            //            VStack(alignment: .leading) {
            Text("Stocks du produit")
                .padding(.horizontal,20)
                .textCase(.uppercase)
                .font(.title)
            HStack {
                
                
                
                
                HStack {
                    TextField("Rechercher un produit par son ID", text: $idProduit)    .textFieldStyle(.roundedBorder)
                        .foregroundColor(darkestBlue)
                        .background(customBlueLighter)
                        .padding()
                }
                
                Button(action: {

                   
                    
                    if let id = Int(idProduit) {
                        ProduitViewModel().getProduct(id: id) { produit in
                          
                            titre = produit.titre
                            quantiteStock = produit.quantiteEnStock
                            quantiteMinStock = produit.quantiteMinStock
                        }
                    }
                    
                }, label: {
                    Image(systemName: "magnifyingglass.circle.fill")
                        .font(.system(size: 50))
                })
                
            }
            //            }
            
            
            //            Spacer()
            VStack(alignment: .leading, spacing: 50) {
                
                HStack {
                    Text("Titre: ")
                        .font(.title2)
                    
                    Text("\(titre)")
                        .font(.title2)
                        .foregroundColor(.red)
                }
                
                HStack {
                    Text("Quantité en stock: ")
                        .font(.title2)
                    
                    Text("\(quantiteStock)")
                        .font(.title2)
                        .foregroundColor(.red)
                }
                
                HStack {
                    Text("Quantité min en stock: ")
                        .font(.title2)
                    Text("\(quantiteMinStock)")
                        .font(.title2)
                        .foregroundColor(.red)
                }
                
                
                
                
                
                
                
                
                
            }
            .padding(.top,50)
            Spacer()

            Spacer()
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(customBlue)
        .navigationBarBackButtonHidden(true)
        
    }

}

struct AfficherStockView_Previews: PreviewProvider {
    static var previews: some View {
        AfficherStockView()
    }
}
