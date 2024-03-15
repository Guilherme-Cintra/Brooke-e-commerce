//
//  LivresCategory.swift
//  Brooke&Co
//
//  Created by Guilherme Cintra Castro on 2023-11-03.
//

import SwiftUI

struct LivresCategory: View {

    @State var nombreItems = 0
    @State var infos = [Livre]()
    @State var geos = [Livre]()
    @State var litteratures = [Livre]()
    @State var cartClick = false
    @Environment(\.dismiss) var dismiss
    @State var afficherInfo = false
    @State var afficherLit = false
    @State var afficherGeo = false
    @State var jeuxClick = false
    
    var body: some View {
        NavigationStack {
            HStack(spacing: 200){
                Button(action: {
                    dismiss()
                }, label: {
                    Image(systemName: "arrowshape.backward.fill")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.black)
                })
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
            NavigationLink(destination: CartView(), isActive: $cartClick,label: {})
            Spacer()
            VStack(alignment: .leading) {
                Button(action: {
                    afficherInfo.toggle()
                    afficherLit = false
                    afficherGeo = false
                }, label: {
                    Text("Informatique")
                        
                        .foregroundColor(.black)
                        .font(.largeTitle)
                })
    //            .background(customBlueLighter)
    //            .cornerRadius(20)
               
                
                .padding()
                if afficherInfo {
                    List(infos) { liv in
                        NavigationLink(destination: BookView(livre: liv), label: {
                            Text("\(liv.titre)")
                                .padding()
                                .frame(width: 260)
                                .foregroundColor(.black)
                        })
                    }.onAppear{
                        LivreViewModel().getLivresInfo {
                            (livres) in
                            infos = livres
                        }
                    }
                    .listStyle(.plain)
                }
                
                Button(action: {
                    afficherLit.toggle()
                    afficherGeo = false
                    afficherInfo = false
                    
                }, label: {
                    Text("Littérature")
                        .foregroundColor(.black)
                        .font(.largeTitle)
                })
                .padding()
    //            .background(customBlueLighter)
    //            .cornerRadius(20)
                
                
                if afficherLit {
                    List(litteratures) { liv in
                        NavigationLink(destination: BookView(livre: liv), label: {
                            Text("\(liv.titre)")
                                .padding()
                                .frame(width: 260)
                                .foregroundColor(.black)
                        })
                    }.onAppear{
                        LivreViewModel().getLesLitterature {
                            (livres) in
                            litteratures = livres
                        }
                    }
                    .listStyle(.plain)
                    
                }
                
                Button(action: {
                    afficherGeo.toggle()
                    afficherInfo = false
                    afficherLit = false
                }, label: {
                    Text("Géographie")
                        .foregroundColor(.black)
                        .font(.largeTitle)
                })
                .padding()
    //            .background(customBlueLighter)
    //            .cornerRadius(20)
                
                if afficherGeo {
                    List(geos) { liv in
                        NavigationLink(destination: BookView(livre: liv), label: {
                            Text("\(liv.titre)")
                                .padding()
                                .frame(width: 260)
                                .foregroundColor(.black)
                        })
                    }
                    
                    .onAppear{
                        LivreViewModel().getLivresGeo {
                            (livres) in
                            geos = livres
                        }
                    }
                    .listStyle(.plain)
                }
                Spacer()
            }
            
            .navigationBarBackButtonHidden(true)
        }
       
        
        
        
     
    }
}

struct LivresCategory_Previews: PreviewProvider {
    static var previews: some View {
        LivresCategory()
    }
}
