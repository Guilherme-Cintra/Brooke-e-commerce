//
//  FilmsCategory.swift
//  Brooke&Co
//
//  Created by Guilherme Cintra Castro on 2023-11-03.
//

import SwiftUI

struct FilmsCategory: View {
    @State var cartClick = false
    @Environment(\.dismiss) var dismiss
    @State var drames = [Film]()
    @State var comedies = [Film]()
    @State var actions = [Film]()
    @State var sciences = [Film]()
    @State var nombreItems = 0
    
    @State var afficherFic = false

    @State var afficherComedie = false

    @State var afficherAction = false
    

    @State var afficherDrame = false
    

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
                    afficherFic.toggle()
                    afficherComedie = false
                    afficherAction = false
                    afficherDrame = false
                }, label: {
                    Text("Science fiction")
                    
                        .foregroundColor(.black)
                        .font(.largeTitle)
                }).padding()
                
                if afficherFic {
                    List(sciences) { film in
                        NavigationLink(destination: MovieView(movie: film), label: {
                            Text("\(film.titre)")
                                .padding()
                                .frame(width: 260)
                                .foregroundColor(.black)
                        })
                    }.onAppear{
                        fimViewModel().getFilmsSciences {
                            (films) in
                            sciences = films
                        }
                    }
                    .listStyle(.plain)
                }
                
                Button(action: {
                    afficherFic = false
                    afficherComedie.toggle()
                    afficherAction = false
                    afficherDrame = false
                }, label: {
                    Text("Comédie")
                    
                        .foregroundColor(.black)
                        .font(.largeTitle)
                }).padding()
                
                if afficherComedie {
                    List(comedies) { film in
                        NavigationLink(destination: MovieView(movie: film), label: {
                            Text("\(film.titre)")
                                .padding()
                                .frame(width: 260)
                                .foregroundColor(.black)
                        })
                    }.onAppear{
                        fimViewModel().getFilmsComedie {
                            (films) in
                            comedies = films
                        }
                    }
                    .listStyle(.plain)
                }
                
                Button(action: {
                    afficherFic = false
                    afficherComedie = false
                    afficherAction.toggle()
                    afficherDrame = false
                }, label: {
                    Text("Action")
                    
                        .foregroundColor(.black)
                        .font(.largeTitle)
                }).padding()
                
                if afficherAction {
                    List(actions) { film in
                        NavigationLink(destination: MovieView(movie: film), label: {
                            Text("\(film.titre)")
                                .padding()
                                .frame(width: 260)
                                .foregroundColor(.black)
                        })
                    }.onAppear{
                        fimViewModel().getFilmsAction {
                            (films) in
                            actions = films
                        }
                    }
                    .listStyle(.plain)
                }
                
                Button(action: {
                    afficherFic = false
                    afficherComedie = false
                    afficherAction = false
                    afficherDrame.toggle()
                }, label: {
                    Text("Drame")
                    
                        .foregroundColor(.black)
                        .font(.largeTitle)
                }).padding()
                
                if afficherDrame {
                    List(drames) { film in
                        NavigationLink(destination: MovieView(movie: film), label: {
                            Text("\(film.titre)")
                                .padding()
                                .frame(width: 260)
                                .foregroundColor(.black)
                        })
                    }.onAppear{
                        fimViewModel().getFilmsDrame {
                            (films) in
                            drames = films
                        }
                    }
                    .listStyle(.plain)
                }
                Spacer()
                
            }   
            
//            .frame(maxWidth: .infinity, maxHeight:.infinity)
//                .background(LinearGradient(colors: [customBlue, customBlueLighter], startPoint: .top, endPoint: .bottom))

                .navigationBarBackButtonHidden(true)
            
        }
       
        
    }
}

struct FilmsCategory_Previews: PreviewProvider {
    static var previews: some View {
        FilmsCategory()
    }
}
