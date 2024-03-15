//
//  ClientHomeView.swift
//  Brooke&Co
//
//  Created by Guilherme Cintra Castro on 2023-11-02.
//

import SwiftUI

struct ClientHomeView: View {
    @State var contactClcik = false
    @State var panierClick = false
    @State var produitClick = false
    @State var profilClick = false
    var body: some View {
        NavigationStack {
            VStack{
                // MARK: - NAVIGATIONS
                NavigationLink(destination: ProfileView(),isActive: $profilClick, label: {
                    
                })
                
                NavigationLink(destination: ProductsView(),isActive: $produitClick, label: {
                    
                })
                
                NavigationLink(destination: ContactView(),isActive: $contactClcik, label: {
                    
                })
                
                NavigationLink(destination: CartView(),isActive: $panierClick, label: {
                    
                })
                
                
                
                
                HeaderView()
                Text("Accueil")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.black)
                    .padding(.top, 30)
                
                VStack(spacing: 20){
                    Button(action: {
                        profilClick = true
                       
                    }, label: {
                        Text("Mon profil")
                            .padding()
                            .frame(width: 300)
                            .foregroundColor(.white)
                    }).background(customBlueDarker)
                        .cornerRadius(20)
                                      
                    Button(action: {
                        produitClick = true
                    }, label: {
                        Text("Produits")
                            .padding()
                            .frame(width: 300)
                            .foregroundColor(.white)
                    }).background(customBlueDarker)
                        .cornerRadius(20)
                                     
                    Button(action: {
                        panierClick = true
                    }, label: {
                        Text("Mon panier")
                            .padding()
                            .frame(width: 300)
                            .foregroundColor(.white)
                    }).background(customBlueDarker)
                        .cornerRadius(20)
                                     
                    Button(action: {
                        contactClcik = true
                    }, label: {
                        Text("Contact")
                            .padding()
                            .frame(width: 300)
                            .foregroundColor(.white)
                    }).background(customBlueDarker)
                        .cornerRadius(20)
                      
                }
                .padding(.top, 70)
                Spacer()
                
            }.background(customBlue)
                .padding(.horizontal, 30)
            .navigationBarBackButtonHidden(true)
        }
        
    }
}

struct ClientHomeView_Previews: PreviewProvider {
    static var previews: some View {
        ClientHomeView()
    }
}
