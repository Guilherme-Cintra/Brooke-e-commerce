//
//  AjouterLivreView.swift
//  ProjectInterfaces
//
//  Created by Rafael Castro on 2023-11-06.
//

import SwiftUI

struct AjouterLivreView: View {
    
    func formatDate(_ date: Date) -> String {
          let formatter = DateFormatter()
          formatter.dateFormat = "yyyy-MM-dd"
          return formatter.string(from: date)
      }
    
    @Environment(\.dismiss) var dismiss
    
    @State private var titre: String = ""
    @State private var prix: String = ""
    @State private var description: String = ""
    @State private var image: String = ""
    @State private var quantiteStock: Int = 0
    @State private var quantiteMinStock: Int = 0
    @State private var isbn: String = ""
    @State private var date: String = ""
    @State private var datePublication = Date()
    @State private var editeur: String = ""
    @State private var auteur: String = ""
    @State private var categorie: String = "Littérature"
    let categories = ["Littérature", "Géographie", "Informatique"]
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
            
            
            
            VStack{
                VStack(alignment: .leading) {
                    
                    TextField("Titre", text: $titre)
                        .font(.title3)
                    
                    TextField("Prix", text: $prix)
                        .font(.title3)
                    
                    TextField("Description", text: $description)
                        .font(.title3)
                    
                    TextField("Image", text: $image)
                        .font(.title3)
                    
                    

                    
                    TextField("ISBN", text: $isbn)
                        .font(.title3)
                    
                    TextField("Éditeur", text: $editeur)  .font(.title3)
                    
                    TextField("Auteur", text: $auteur)
                        .font(.title3)
                    
                    
                    
                    DatePicker("Date de publication", selection: $datePublication, displayedComponents: .date)
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
                  
                    
                    
                    
                    Picker("Catégorie", selection: $categorie) {
                        ForEach(categories, id: \.self) {
                            Text($0)
                                .backgroundStyle(customBlueLighter)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding()
                }.padding()
                    .background(customBlueLighter)
                    .cornerRadius(30)
                    .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(lineWidth: 2)
                            .foregroundColor(.black)
                    )
                    .padding(.horizontal, 10)
                
                
                Button(action: {
                    
                    let formattedDate = formatDate(datePublication)
                                        if let doublePrix = Double(prix) {
                                            ProduitViewModel().postProduct(titre: titre, prix: doublePrix, description: description, image: image, quantite: quantiteStock, quantiteMin: quantiteMinStock) {
                                                produit in
                                                
                                                ProduitViewModel().postLivre(produit: produit, prix: doublePrix, isbn: isbn, dateParution: formattedDate, editeur: editeur, auteurs: auteur, categories: categorie) {
                                                    livre in
                                                    print(livre)
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



struct AjouterLivreView_Previews: PreviewProvider {
    static var previews: some View {
        AjouterLivreView()
    }
}
