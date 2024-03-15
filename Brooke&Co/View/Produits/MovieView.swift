//
//  MovieView.swift
//  Brooke&Co
//
//  Created by Guilherme Cintra Castro on 2023-11-05.
//

import SwiftUI
import AVKit
import Photos

struct MovieView: View {
    @State var nombreItems = 0
    @State private var showSnackbar: Bool = false
    var movie: Film
    @State var cartClick = false
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack {
            
            NavigationLink(destination: CartView(), isActive: $cartClick,label: {})
            
            VStack{
                
                // MARK: - HEADER
                
                HStack (spacing: 10){
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
                
//                Image("\(movie.image)")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 300, height: 300)
                 
                        NavigationStack{
                            VideoPlayer(player: AVPlayer(url: URL(string: movie.videoExtrait)!))
//                                .navigationTitle("Video Player")
                        }
                
                VStack (alignment: .center, spacing: 2){
                    Text("\(movie.titre)")
                        .font(.largeTitle)
                        .bold()
                    Text("\(movie.description)")
                        .bold()
                        .padding()
                        .multilineTextAlignment(.center)
                        .font(.caption)
                    
                        HStack {
                            Text("Acteurs : \(movie.acteurs)")
                                .bold()
                                .font(.caption)
                        }
                    
                    
                    Text("\(movie.format)")
                        .bold()
                        .multilineTextAlignment(.center)
                        .font(.headline)
                    
                    
                    Text("Prix : \(String(format: "%.2f", movie.prix)) $")
                        .bold()
                        .multilineTextAlignment(.center)
                        .font(.caption)
                }
                
                Button(action: {
                    let idClient = UserDefaults.standard.integer(forKey: "userId")
                    
                    print("\(idClient)")
                    print("\(movie.id)")
                    PanierViewModel().postItem(idClient: idClient, idProduit: movie.id, imageProduit: movie.image, titreProduit: movie.titre, prixProduit: movie.prix)
                    
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
                }).onTapGesture {
                 
                        let id = UserDefaults.standard.integer(forKey: "userId")
                    PanierViewModel().getNombreDuClient(idClient: id){
                        nombre in
                        
                        nombreItems = nombre
                    }
                }
                
                .background(customBlueLighter)
                .cornerRadius(20)
                .padding(.top,50)
                
                
               
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .background(LinearGradient(colors: [customBlueLighter, customBlueDarker], startPoint: .top, endPoint: .bottom))
                .frame(maxWidth: .infinity)
                
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
                   Text("Film ajouté au panier")
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

struct MovieView_Previews: PreviewProvider {
    static var previews: some View {
        MovieView(movie:Film(id: 1, titre: "Film", prix: 20.20, description: "euwvgdbhajsbhjk", image: "harry", quantiteEnStock: 20, quantiteMinStock: 10, acteurs: "personne", realisateur: "bhwejkdn", format: "DVD", videoExtrait: "biwejnkdlm", categories: "drame"))
    }
}
