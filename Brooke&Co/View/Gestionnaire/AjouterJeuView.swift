////
////  AjouterJeuView.swift
////  ProjectInterfaces
////
////  Created by Rafael Castro on 2023-11-06.
////

import SwiftUI

struct AjouterJeuView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State private var titre: String = ""
    @State private var prix: String = ""
    @State private var description: String = ""
    @State private var image: String = ""
    @State private var auteur: String = ""
    @State private var quantiteStock: Int = 0
    @State private var quantiteMinStock: Int = 0
    
    
    @State private var collection: String = "Xbox"
    let collections = ["Nintendo Wii U", "Playstation", "Xbox"]
    
    var body: some View {
        VStack {
            VStack(spacing:10) {
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
                
                VStack{

                    Text("Infos du Jeu")
                        .font(.title)
                        .bold()
                    VStack {
                        
                            TextField("Titre", text: $titre)
                            .font(.title3)
         
//                         
                            TextField("Prix", text: $prix)
                            .font(.title3)
       
                            TextField("Description", text: $description)
                            .font(.title3)
              
                            TextField("URL de l'Image", text: $image)
                            .font(.title3)
                        
                        TextField("Auteur", text: $auteur)
                            .font(.title3)
                      
                       
         
                
                            
                        
                        VStack(alignment:.leading) {
                            HStack {
                                Text("Quantié en stock")
                                Picker("Quantité en stock", selection: $quantiteStock) {
                                    ForEach(0..<101) {
                                        Text("\($0)")
                                    }
                                }
                            }
                            HStack {
                                Text("Quantié minimum en stock")
                                Picker("Quantité minimum en stock", selection: $quantiteMinStock) {
                                    ForEach(0..<101) {
                                        Text("\($0)")
                                    }
                                }
                            }
                            
                        }
                        
                        Picker("Catégorie", selection: $collection) {
                            ForEach(collections, id: \.self) {
                                Text($0)
                                    .backgroundStyle(customBlueLighter)
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .padding()
                        
                    }   .padding()
                        .background(customBlueLighter)
                        .cornerRadius(30)
                        .overlay(
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(lineWidth: 2)
                                .foregroundColor(.black)
                        )
                        .padding(.horizontal, 20)
                        .padding(.bottom)
                        
                    Button(action: {
                        
                        if let doublePrix = Double(prix) {
                            ProduitViewModel().postProduct(titre: titre, prix: doublePrix, description: description, image: image, quantite: quantiteStock, quantiteMin: quantiteMinStock) {
                                product in
                                
                                ProduitViewModel().postJeu(produit: product, prix: doublePrix, auteurs: auteur, collection: collection) {
                                    jeu in
                                    print(jeu)
                                }
                            }
                            
                            
                            dismiss()
                        }
                    }, label: {
                        Text("AJOUTER")
                            .padding()
                            .frame(width: 200)
                            .foregroundColor(.white)
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    })
                    .background(darkestBlue)
                    .cornerRadius(20)
                    
                }
                
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .background(LinearGradient(colors: [customBlue, customBlueLighter], startPoint: .top, endPoint: .bottom))

            .navigationBarBackButtonHidden(true)
        }
    }
}

//#Preview {
//    AjouterJeuView()
//}
struct AjouterJeuView_Previews: PreviewProvider {
    static var previews: some View {
        AjouterJeuView()
    }
}
