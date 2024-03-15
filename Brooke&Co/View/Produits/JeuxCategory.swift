//
//  JeuxCategory.swift
//  Brooke&Co
//
//  Created by Guilherme Cintra Castro on 2023-11-03.
//

import SwiftUI

struct JeuxCategory: View {
    @State var nombreItems = 0
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
                      
                        NavigationLink(destination: GameView(game: jeux), label: {
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
                      
                        NavigationLink(destination: GameView(game: jeux), label: {
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
                      
                        NavigationLink(destination: GameView(game: jeux), label: {
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

struct JeuxCategory_Previews: PreviewProvider {
    static var previews: some View {
        JeuxCategory()
    }
}
