//
//  ProductsView.swift
//  Brooke&Co
//
//  Created by Guilherme Cintra Castro on 2023-11-02.
//

import SwiftUI

struct ProductsView: View {
    
    @State var nombreItems = 0
    @State var afficherCategoriesLivres = false
    @State var afficherCategoriesFilms = false
    @State var afficherCategoriesJeux = false
    @State var cartClick = false

    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            
            NavigationLink(destination: CartView(), isActive: $cartClick, label: {})
            
            NavigationLink(destination: FilmsCategory(), isActive: $afficherCategoriesFilms, label: {})
            NavigationLink(destination: LivresCategory(), isActive: $afficherCategoriesLivres, label: {})
            
            NavigationLink(destination: JeuxCategory(), isActive: $afficherCategoriesJeux, label: {})
            
            
            VStack(spacing: 20){
              
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
                
                ScrollView {
                    
                    VStack(spacing: 30){
                        Button(action: {
                            afficherCategoriesLivres.toggle()
                            afficherCategoriesFilms = false
                            afficherCategoriesJeux = false
                        })
                        {
                            Text("Livres")
                                .padding()
                                .frame(width: 300)
                                .foregroundColor(.white)
                                .font(.title)
                                .textCase(.uppercase)
                        }
                        .background(customBlueDarker)
                        .cornerRadius(20)
//                        if afficherCategoriesLivres {
//                            LivresCategory()
//                        }
                        
                        Button(action: {
                            afficherCategoriesFilms.toggle()
                            afficherCategoriesJeux = false
                            afficherCategoriesLivres = false
                        }) {
                            Text("Films")
                                .padding()
                                .frame(width: 300)
                                .foregroundColor(.white)
                                .font(.title)
                                .textCase(.uppercase)
                        }
                         .background(customBlueDarker)
                        .cornerRadius(20)
                        
//                        if afficherCategoriesFilms {
//                            FilmsCategory()
//                        }
                        
                        Button(action: {
                            afficherCategoriesJeux.toggle()
                            afficherCategoriesFilms = false
                            afficherCategoriesLivres = false
                        })
                        {
                            Text("Jeux")
                                .padding()
                                .frame(width: 300)
                                .foregroundColor(.white)
                                .font(.title)
                                .textCase(.uppercase)
                        }
                        .background(customBlueDarker)
                        .cornerRadius(20)
                    }.padding(.horizontal,200)
                    
//                    if afficherCategoriesJeux {
//                        JeuxCategory()
//                    }
                    
                }
                
                
                Spacer()
            }
            .background(LinearGradient(colors: [customBlueLighter, customBlue], startPoint: .top, endPoint: .bottom))
                .frame(maxWidth: .infinity)
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct ProductsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductsView()
    }
}
