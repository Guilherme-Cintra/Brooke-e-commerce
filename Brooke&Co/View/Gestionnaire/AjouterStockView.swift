//
//  AjouterStockView.swift
//  ProjectInterfaces
//
//  Created by Rafael Castro on 2023-11-06.
//

import SwiftUI

struct AjouterStockView: View {
    
    @Environment(\.dismiss) var dismiss
    
    
    
    @State private var idProduit: String = ""
    @State private var titre: String = ""
    @State private var trouve = false
    @State private var quantite: Int  = 0
    @State private var quantiteStock = 0
    @State private var quantiteMinStock = 0
    
    
    //    var produits: [Produit] = [Produit(id: 1, quantiteStock: 20, quantiteMinStock: 5),
    //                            Produit(id: 2, quantiteStock: 10, quantiteMinStock: 5)]
    
    func rechercher(id:Int){
        ProduitViewModel().getProduct(id: id) { produit in
            
            titre = produit.titre
            quantiteStock = produit.quantiteEnStock
            quantiteMinStock = produit.quantiteMinStock
            
            trouve = true
            
            
        }
    }
    func ajouterProduit(id:Int){
        ProduitViewModel().getProduct(id: id) { produit in
            titre = produit.titre
            quantiteStock = produit.quantiteEnStock
            quantiteMinStock = produit.quantiteMinStock
            let product = Product(titre: produit.titre, prix: produit.prix, description: produit.description, image: produit.image, quantiteEnStock: produit.quantiteEnStock, quantiteMinStock: produit.quantiteMinStock)
            ProduitViewModel().updateProduct(id: id, produit: product, qte: quantite)
            let prixReel = product.prix * Double(quantite)
            ProduitViewModel().updateFilm(id: id, produit: produit, qte: quantite)
            ProduitViewModel().updateJeux(id: id, produit: produit, qte: quantite)
            
            ProduitViewModel().updateLivre(id: id, produit: produit, qte: quantite)
            
            ApprovisionnementViewModel().createApprovisionnement {
                approvisionnement in
                
                ApprovisionnementViewModel().createProduitApprovisionne(idProduit: id, approvisionnement: approvisionnement, quantite: quantite, prixReel: prixReel)
                
            }
            nettoyer()
            
        }
    }
    
    func nettoyer(){
        titre = ""
        quantiteStock = 0
        idProduit = ""
        quantiteMinStock = 0
    }
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
            Text("Rechercher un produit")
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
                       
                        rechercher(id: id)
                        
                    }
                }, label: {
                    Image(systemName: "magnifyingglass.circle.fill")
                        .font(.system(size: 50))
                })
            }
            
            VStack(alignment: .leading, spacing: 50) {
                HStack {
                    Text("Titre du produit: ")
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
            VStack{
                HStack {
                    Text("Quantité à ajouter:")
                        .font(.title2)
                    
                    
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 200)
                    
                    Picker("",selection: $quantite) {
                        ForEach(0...100, id: \.self) {
                            Text("\($0)").tag($0)
                                .foregroundColor(.black)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                }
            }
            
            Button(action: {
                
                    if let id = Int(idProduit) {
                     
                        ajouterProduit(id: id)

                        
                    }
            }, label: {
                Text("Ajouter")
                    .padding()
                    .foregroundColor(.white)
                    .frame(width: 200)
                    .cornerRadius(30)
                    .bold()
                    .textCase(.uppercase)
                
            })
            .background(customBlueDarker)
            .cornerRadius(30)
            .padding(.top,30)
            
            
            
            
            
            
            
            
            
            //            Button("AJOUTER") {
            //                ajouter()
            //            }
            //            .frame(width: 120, height: 30)
            //            .foregroundColor(.white)
            //            .background(.blue)
            //            .cornerRadius(30)
            //            .bold()
            
            
            Spacer()
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(customBlue)
        .navigationBarBackButtonHidden(true)
        
    }
    //
    //    func ajouter() {
    //        var quantiteAjouter = 0
    //        if let produit = produitChoisi {
    //           quantite2 = quantite
    //                quantiteAjouter = quantite2
    //
    //        }
    //        produitChoisi?.quantiteStock += quantiteAjouter
    //
    //        if let produit = produitChoisi {
    //            quantiteStock = "\(produit.quantiteStock)"
    //        }
    //    }
    //
    //    func rechercher(id: Int, tab: [Product]) {
    //        for item in tab {
    //            if item.id == id {
    //                produitChoisi = item
    //                quantiteStock = String(item.quantiteEnStock)
    //                quantiteMinStock = String(item.quantiteMin)
    //            }
    //        }
    //    }
    //    class Produit {
    //        var id:Int
    //        var quantiteStock:Int
    //        var quantiteMinStock:Int
    //        init(id: Int, quantiteStock: Int, quantiteMinStock: Int) {
    //            self.id = id
    //            self.quantiteStock = quantiteStock
    //            self.quantiteMinStock = quantiteMinStock
    //        }
    //    }
}

//#Preview {
//    AjouterStockView()
//}
struct AjouterStockView_Previews: PreviewProvider {
    static var previews: some View {
        AjouterStockView()
    }
}
