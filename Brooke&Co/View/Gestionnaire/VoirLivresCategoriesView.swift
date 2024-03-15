//
//  VoirLivresCategoriesView.swift
//  Brooke&Co
//
//  Created by Guilherme Cintra Castro on 2023-11-07.
//

import SwiftUI

struct VoirLivresCategoriesView: View {
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
                        NavigationLink(destination: VoirLivreView(livre: liv), label: {
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
                        NavigationLink(destination: VoirLivreView(livre: liv), label: {
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
                        NavigationLink(destination: VoirLivreView(livre: liv), label: {
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

//#Preview {
//    VoirLivresCategoriesView()
//}
struct VoirLivresCategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        VoirLivresCategoriesView()
    }
}
