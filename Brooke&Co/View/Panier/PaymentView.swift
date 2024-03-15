//
//  PaymentView.swift
//  Brooke&Co
//
//  Created by Charlie Leduc on 2023-12-06.
//

import SwiftUI

struct PaymentView: View {
    @State var paye = false
    @State var ligneCommandes = [ItemResponse]()
    @State var produits = [ProduitResponse]()
    @State var total = 0.0
    let id = UserDefaults.standard.integer(forKey: "userId")
    
    
    func soustraireQte(ide:Int){
            ProduitViewModel().soustraireProduct(id: ide)
    }
    
    func creationLC(numero: Int) {
      
        for i in 0..<ligneCommandes.count {
 

            LigneCommandeViewModel().postLigneCommande(numCommande: numero, idProduit: ligneCommandes[i].idProduit, quantite: 1, prixReel: ligneCommandes[i].prixProduit)
            
            

        }
        
        for items in ligneCommandes {
            
            print("ID DU PRODUIT: \(items.idProduit)")
            soustraireQte(ide: items.idProduit)
        }
    }
    
  
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack {
            
            NavigationLink(destination: ClientHomeView(),isActive: $paye, label: {})
            
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
                        .padding(.horizontal,50)
                }
                Spacer()
                HStack(spacing: 40) {
                    
                    // MARK: - IMAGE
                    Image(systemName: "newspaper")
                        .resizable()
                    .frame(width: 100, height: 100)
                    .foregroundColor(goldColor)
                    .padding()
                    
                    // MARK: - INFO ITEM
                    VStack(alignment: .leading) {
                        
                        Text("Total avec taxes")
                            .font(.title2)
                            .foregroundColor(.white)
                            .bold()
                            .font(.system(size: 20))
                        HStack {
                            Text("Prix:")
                                .foregroundColor(.white)
                                .font(.system(size: 20))
                            Text(String(format: "%.2f $", total))
                                .foregroundColor(.white)
                                .font(.system(size: 20))
                                .bold()
                        }

                    }
                }
                .padding()
                .background(customBlueDarker)
               
                .overlay(
                    Rectangle()
                        
                        .stroke(darkestBlue, lineWidth: 5)
                       
                    
                    
            )
                Spacer()
                Button(action: {
                    
                    
                    CommandeViewModel().postCommande(idClient: id) {
                        commande in
                        print(commande.numero)
                        
                        creationLC(numero: commande.numero)
                        
                       

                        PanierViewModel().deleteAll()
                        paye = true
                        
    //                    LigneCommandeViewModel().postLigneCommande(numCommande:commande.numero, idProduit: ligneCommandes[0].idProduit, quantite: 1, prixReel: ligneCommandes[0].prixProduit)
                    }
                  
                }, label: {
                    Text("Payer avec paypal")
                    
                        .bold()
                        .font(.title2)
                        .padding(20)
                        .padding(.horizontal, 40)
                        .textCase(.uppercase)
                        .background(.yellow)
                        .cornerRadius(20)
                })
                .padding(.bottom, 40)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(customBlue)
            .navigationBarBackButtonHidden(true)
            .onAppear{
              
               PanierViewModel().getTotalDuClient(id: id) {
                    prix in
                    
                    total = prix
                   
                   PanierViewModel().getItemsDuClient(idClient: id) {
                       (items) in
                       ligneCommandes = items
                       print("nombre de lignes de commandes\(ligneCommandes.count)")
                   }
                }
        }
        }
       
    }
}

#Preview {
    PaymentView()
}
