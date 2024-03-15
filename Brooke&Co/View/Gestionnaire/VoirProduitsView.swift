//
//  VoirProduitsView.swift
//  Brooke&Co
//
//  Created by Guilherme Cintra Castro on 2023-11-07.
//

import SwiftUI

struct VoirProduitsView: View {
    
    
    @State var afficherCategoriesLivres = false
    @State var afficherCategoriesFilms = false
    @State var afficherCategoriesJeux = false
    @State var cart = false

    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            
            NavigationLink(destination: CartView(), isActive: $cart, label: {})
            
            
            NavigationLink(destination: VoirJeuxCategoriesView(), isActive: $afficherCategoriesJeux, label: {})
            
            NavigationLink(destination: VoirFilmsCategoriesView(), isActive: $afficherCategoriesFilms, label: {})
            
            NavigationLink(destination: VoirLivresCategoriesView(), isActive: $afficherCategoriesLivres, label: {})
            
            
            VStack(spacing: 20){
              
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
                        .padding(.horizontal,20)
                }

                
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
//                            VoirLivresCategoriesView()
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
//                           VoirFilmsCategoriesView()
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
//                        VoirJeuxCategoriesView()
//                    }
                    
                }
                
                
                Spacer()
            }
            .background(LinearGradient(colors: [customBlueLighter, customBlue], startPoint: .top, endPoint: .bottom))
                .frame(maxWidth: .infinity)
            
        }.navigationBarBackButtonHidden(true)
    }
}

//#Preview {
//    VoirProduitsView()
//}

struct VoirProduitsView_Previews: PreviewProvider {
    static var previews: some View {
        VoirProduitsView()
    }
}
