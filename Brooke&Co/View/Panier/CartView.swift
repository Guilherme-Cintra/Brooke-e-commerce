//
//  CartView.swift
//  Brooke&Co
//
//  Created by Guilherme Cintra Castro on 2023-11-05.
//

import SwiftUI

struct CartView: View {
    @State var total = 0.0
    
    func calculTotal () -> Double {
        var total = 0.0
        for i in listeItems {
           total += i.prixProduit
        }
        return total * 1.4975
    }
    
    @State var listeItems = [ItemResponse]()

    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack {
            
            VStack{
           
                HStack {
                    Button(action: {
                        dismiss()
                        }, label: {
                            Image(systemName: "arrowshape.backward.fill")
                                
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                                .foregroundColor(.black)
                    })
                    Image("Logo")
                        .padding(.horizontal,50)
                }
                 
                 
                HStack {
                    Text("Panier")
                        .font(.largeTitle)
                        .bold()
                        .multilineTextAlignment(.center)
                  
                }.frame(maxWidth: .infinity)
                
                .padding(0)
                
                
                
                ScrollView{
                    VStack{
                        
                        
                            ForEach(listeItems, id: \.id) { produit in
                                CartProductView(produit: produit)
                            }
                        
                    }
                }
                .onAppear {
                    total = calculTotal()
                    let id = UserDefaults.standard.integer(forKey: "userId")
                    PanierViewModel().getItemsDuClient(idClient: id){ (items) in
                        listeItems = items 
                    }
                    
    //                listeItems
                    
                    
                }
                Spacer()
                Button(action: {
                    total = calculTotal()
                    let id = UserDefaults.standard.integer(forKey: "userId")
                    PanierViewModel().deleteAll()
                    PanierViewModel().getItemsDuClient(idClient: id){ (items) in
                        listeItems = items
                    }
                }, label: {
                    Text("Vider le panier")
                        .padding()
                })
                .background(.white)
                .cornerRadius(30)
//                PaymentFooterView()
                NavigationLink(destination: PaymentView(), label: {Text("Facture")
                        .padding()
                        .padding(.horizontal,50)
                        .font(.title)
                        .background(.white)
                        .cornerRadius(30)
                        .overlay(
                                    RoundedRectangle(cornerRadius: 30)
                                        .stroke(Color.gray, lineWidth: 1)
                                       
                                )
                                .shadow(color: .gray, radius: 5, x: 0, y: 2)
                    
                })
                
                .padding()
            }.background(customBlue)
                .frame(maxWidth: .infinity)
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}
