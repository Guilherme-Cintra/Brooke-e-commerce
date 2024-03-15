//
//  GameView.swift
//  Brooke&Co
//
//  Created by Guilherme Cintra Castro on 2023-11-03.
//

import SwiftUI

struct GameView: View {
    @State var nombreItems = 0
    @State private var showSnackbar: Bool = false

    let game : Jeu
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
                
                Image("\(game.image)")
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
                    
                    Text("Collection :\(game.collection)")
                        .bold()
                        .multilineTextAlignment(.center)
                        .font(.headline)
                    
                    Text("Prix : \(String(format: "%.2f", game.prix)) $")
                        .bold()
                        .multilineTextAlignment(.center)
                        .font(.headline)
                }
                
                Button(action: {

                    let idClient = UserDefaults.standard.integer(forKey: "userId")
                    
                    print("\(idClient)")
                    print("\(game.id)")
                    PanierViewModel().postItem(idClient: idClient, idProduit: game.id, imageProduit: game.image, titreProduit: game.titre, prixProduit: game.prix)
                    
                    
                    withAnimation {
                                        showSnackbar = true
                                    }
                    
                    PanierViewModel().getNombreDuClient(idClient: idClient){
                        nombre in
                        
                        nombreItems = nombre
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
                   Text("Jeu ajouté au panier")
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

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(game: Jeu(id: 1, titre: "hribfejkn", prix: 20.20, description: "ufhbdjkn", image: "game", quantiteEnStock: 10, quantiteMinStock: 2, auteurs: "PS Collection", collection: "PS"))
//            .environment(\.managedObjectContext, DataController.preview.container.viewContext)
    }
}
