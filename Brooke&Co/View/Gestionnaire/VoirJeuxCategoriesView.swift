//
//  VoirJeuxCategoriesView.swift
//  Brooke&Co
//
//  Created by Guilherme Cintra Castro on 2023-11-07.
//

import SwiftUI

struct VoirJeuxCategoriesView: View {
    @State var cartClick = false
    @Environment(\.dismiss) var dismiss
    @State var psgames = [Jeu]()
    @State var xbgames = [Jeu]()
    @State var wigames = [Jeu]()
    @State var afficherPS = false

    @State var afficherXbox = false
    @State var afficherWIU = false

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
            VStackLayout(alignment: .leading){
                Button(action: {
                    afficherPS.toggle()
                    afficherXbox = false
                    afficherWIU = false
                    
                }, label: {
                    Text("Playstation")
                    
                        .foregroundColor(.black)
                        .font(.largeTitle)
                })
                .padding()
                
                if afficherPS {
                    
                    List(psgames) { jeux in
                      
                        NavigationLink(destination: VoirJeuxView(game: jeux), label: {
                            Text("\(jeux.titre)")
                                .padding()
                                .frame(width: 260)
                                .foregroundColor(.black)
                        })
                    }.onAppear {
                        JeuxViewModel().getJeuxPS {
                            (jeux) in
                            psgames = jeux
                            
                        }
                    }
                }
                
                Button(action: {
                    afficherPS = false
                    afficherXbox.toggle()
                    afficherWIU = false
                    
                }, label: {
                    Text("XBox")
                    
                        .foregroundColor(.black)
                        .font(.largeTitle)
                })
                .padding()
                
                if afficherXbox {
                    List(xbgames) { jeux in
                      
                        NavigationLink(destination: VoirJeuxView(game: jeux), label: {
                            Text("\(jeux.titre)")
                                .padding()
                                .frame(width: 260)
                                .foregroundColor(.black)
                        })
                    }.onAppear {
                        JeuxViewModel().getJeuxXbox {
                            (jeux) in
                            xbgames = jeux
                            
                        }
                    }
                }
                
                Button(action: {
                    afficherPS = false
                    afficherXbox = false
                    afficherWIU.toggle()
                    
                }, label: {
                    Text("Nintendo WI U")
                    
                        .foregroundColor(.black)
                        .font(.largeTitle)
                })
                .padding()
                
                if afficherWIU {
                    List(wigames) { jeux in
                      
                        NavigationLink(destination: VoirJeuxView(game: jeux), label: {
                            Text("\(jeux.titre)")
                                .padding()
                                .frame(width: 260)
                                .foregroundColor(.black)
                        })
                    }.onAppear {
                        JeuxViewModel().getJeuxWI {
                            (jeux) in
                            wigames = jeux
                            
                        }
                    }
                }
                Spacer()
            }
//            .frame(maxWidth: .infinity, maxHeight:.infinity)
//                .background(LinearGradient(colors: [customBlue, customBlueLighter], startPoint: .top, endPoint: .bottom))

                .navigationBarBackButtonHidden(true)
        }
    }
}
//
//#Preview {
//    VoirJeuxCategoriesView()
//}

struct VoirJeuxCategories_Previews: PreviewProvider {
    static var previews: some View {
        VoirJeuxCategoriesView()
    }
}
