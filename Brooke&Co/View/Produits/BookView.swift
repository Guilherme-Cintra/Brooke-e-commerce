//
//  BookView.swift
//  Brooke&Co
//
//  Created by Guilherme Cintra Castro on 2023-11-03.
//

import SwiftUI

struct BookView: View {
    @State var nombreItems = 0
    @State private var showSnackbar: Bool = false
    var livre : Livre
    @State var cartClick = false
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack {
            VStack {
                
                NavigationLink(destination: CartView(), isActive: $cartClick,label: {})
                
                
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
                    
                    
                    ZStack {
                        
                        Button(action: {
                            cartClick = true
                        }, label: {
                            Image(systemName: "cart.fill")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .foregroundColor(.black)
                    })
                        Text("\(nombreItems)")
                            .bold()
                            .foregroundStyle(.white)
                            .font(.caption)
                            
                            .padding(10)
                            .background(.red)
                            .cornerRadius(50)
                            .offset(x:10,y:-20)
                        
                    }.onAppear(){
                        let id = UserDefaults.standard.integer(forKey: "userId")
                        PanierViewModel().getNombreDuClient(idClient: id){
                            nombre in
                            
                            nombreItems = nombre
                        }
                    }
                    
                    
                }
                .padding(.top, 20)
                .padding(.horizontal, 30)
                
                
                
                
                
              
                
                // MARK: - PRODUIT
                
                Image("\(livre.image)")
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
                
                Button(action: {
                    let idClient = UserDefaults.standard.integer(forKey: "userId")
                    
                    print("\(idClient)")
                    print("\(livre.id)")
                    PanierViewModel().postItem(idClient: idClient, idProduit: livre.id, imageProduit: livre.image, titreProduit: livre.titre, prixProduit: livre.prix)
                    withAnimation {
                                       showSnackbar = true
                                   }
                }, label: {
                    Text("Ajouter au parnier")
                        .foregroundColor(.black)
                        .frame(width: 300)
                        .padding()
                        .textCase(.uppercase)
                        .bold()
                })
                .background(customBlueLighter)
                .cornerRadius(20)
                .padding(.top,50)
                Spacer()
                
            }
            .frame(maxWidth: .infinity)
            .background(LinearGradient(colors: [customBlueLighter, customBlueDarker], startPoint: .top, endPoint: .bottom))
               
        .navigationBarBackButtonHidden(true)
        }
        .overlay(
                   snackbar
               )
    }
    private var snackbar: some View {
           VStack {
               Spacer()
               if showSnackbar {
                   Text("Livre ajouté au panier")
                       .padding()
                       .background(Color.gray)
                       .cornerRadius(8)
                       .transition(.move(edge: .bottom))
                       .onAppear {
                           DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                               withAnimation {
                                   showSnackbar = false
                               }
                           }
                       }
               }
           }
           .padding()
       }
   }

struct BookView_Previews: PreviewProvider {
    static var previews: some View {
        BookView(livre: Livre(id: 1, titre: "helo", prix: 20.00, description: "ugrhbefwjdkn", image: "harry", quantiteEnStock: 10, quantiteMinStock: 1, isbn: "12332", dateParution:"2020-10-10", editeur: "hehe", auteurs: "J.K. Rowling", categories: "heheh"))    }
}
