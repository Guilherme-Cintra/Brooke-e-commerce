
//  AjouterFilmView.swift
//  ProjectInterfaces
//
//  Created by Rafael Castro on 2023-11-06.


import SwiftUI

struct AjouterFilmView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State private var titre: String = ""
    @State private var prix: String = ""
    @State private var description: String = ""
    @State private var image: String = ""
    @State private var quantiteStock: Int = 0
    @State private var quantiteMinStock: Int = 0
    @State private var categorie: String = "Science Fiction"
    let categories = ["Drame", "Comédie", "Science Fiction", "Action"]
    
    @State private var acteurs: String = ""
    @State private var realisateur: String = ""
    @State private var format: String = ""
    @State private var videoExtrait: String = ""
    @State private var errorMsg: String = ""
    
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
//                VStack {
//
//
//                                                    TextField("Titre", text: $titre)
//                                                .font(.title2)
//
//                                                    TextField("Prix", text: $prix)
//                                                .font(.title2)
//
//                                                    TextField("Description", text: $description)
//                                                .font(.title2)
//
//                                                    TextField("Image", text: $image)
//                                                .font(.title2)
//
//                                                    TextField("Quantité en stock", text: $quantiteStock)
//                                                .font(.title2)
//
//                                                    TextField("Quantité minimum en stock", text: $quantiteMinStock)
//                                                .font(.title2)
//
//
//
//
//                }.padding()
//                    .background(customBlueLighter)
//                    .cornerRadius(30)
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 30)
//                            .stroke(lineWidth: 2)
//                            .foregroundColor(.black)
//                    )
//                    .padding()
         
                    VStack {

                                TextField("Titre", text: $titre)
                            .font(.title2)
    //                    Divider()
                                TextField("Prix", text: $prix)
                            .font(.title2)
    //                    Divider()
                                TextField("Description", text: $description)
                            .font(.title2)
    //                    Divider()
                                TextField("Image", text: $image)
                            .font(.title2)
    //                    Divider()

    //                    Divider()
                                TextField("Acteurs", text: $acteurs)
                            .font(.title2)
    //                    Divider()
                                TextField("Réalisateur", text: $realisateur)
                            .font(.title2)
    //                    Divider()
                                TextField("format", text: $format)
                            .font(.title2)
    //                    Divider()
                                TextField("Extraît vidéo", text: $videoExtrait)
                            .font(.title2)
                        Picker("Catégorie", selection: $categorie) {
                            ForEach(categories, id: \.self) {
                                Text($0)
                                    .backgroundStyle(customBlueLighter)
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .padding()
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
    //
                               

                    }.padding()
                        .background(customBlueLighter)
                        .cornerRadius(30)
                        .overlay(
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(lineWidth: 2)
                                .foregroundColor(.black)
                        )
                        .padding(.horizontal, 40)
                        .padding(.bottom, 10)
                
                Text("\(errorMsg)")
                    .font(.caption2)
                    .foregroundStyle(.red)
                Button(action: {
                    
                    if let doublePrix = Double(prix) {
                        ProduitViewModel().postProduct(titre: titre, prix: doublePrix, description: description, image: image, quantite: quantiteStock, quantiteMin: quantiteMinStock) {
                            product in
                            
                            ProduitViewModel().postFilm(product: product, prix: doublePrix, acteurs: acteurs, realisteur: realisateur, format: format, videoExtrait: videoExtrait, categorie: categorie) {
                                film in
                                print(film)
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

//#Preview {
//    AjouterFilmView()
//}

struct AjouterFilmView_Previews: PreviewProvider {
    static var previews: some View {
        AjouterFilmView()
    }
}
