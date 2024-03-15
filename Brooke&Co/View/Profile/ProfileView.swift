//
//  ProfileView.swift
//  Brooke&Co
//
//  Created by Guilherme Cintra Castro on 2023-11-02.
//

import SwiftUI

struct ProfileView: View {
    @Environment(\.dismiss) var dismiss

    @State var edit = false
    @State var renouvel = false
    @State var cartClick = false
    @State var dateExpiration = ""
    
    @State private var userId: Int = 0
        @State private var userNom: String = ""
        @State private var userPrenom: String = ""
        @State private var userCourriel: String = ""
//    @FetchRequest( sortDescriptors: [NSSortDescriptor(keyPath: \ClientEntity.nom, ascending: true)])
//
//        var user : FetchedResults<ClientEntity>
    
   
 
    
    
    var body: some View {
        NavigationStack {
            VStack{
                
                // MARK: - NAVIGATIONS
               
                
                NavigationLink(destination: EditProfileView(), isActive: $edit, label: {
                    
                })
                
                NavigationLink(destination: PayRenouvelView(), isActive: $renouvel, label: {
                    
                }) 
                
                NavigationLink(destination: CartView(), isActive: $cartClick, label: {
                    
                })
                
                
                
                HStack(spacing: 200){
                    Button(action: {
                        dismiss()
                    }, label: {
                        Image(systemName: "arrowshape.backward.fill")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.black)
                    })
                    Button(action: {
                        cartClick = true
                    }, label: {
                        Image(systemName: "cart.fill")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.black)
                    })
                }

                
                VStack {
                    Image(systemName:"person.circle.fill")
                        .resizable()
                        .foregroundColor(.black)
                        .frame(width: 150, height: 150)
                        .padding()
//                    
//                    VStack {
//                        Text("Indetifiction unique")
//                            .foregroundColor(customBlueDarker)
//                        Text("298749763")
//                            .foregroundColor(customBlueDarker)
//                    }
                    
                    
                    
                }
                
                VStack {
                    VStack(alignment: .leading) {
                        HStack{
                            Text("Nom: ")
                            Text("\(userPrenom)")
                        }
                        
                        HStack{
                            Text("Prenom: ")
                            Text("\(userNom)")
                        }
                        
                        HStack{
                            Text("Courriel: ")
                            Text("\(userCourriel)")
                            
                        }
                        
                        
//                        HStack{
//                            Text("Mot de passe: ")
//                            Text("\(user.first?.password ?? "")")
//                        }
                    }
                    .padding(.top, 20)
                    
                    
                    
                    
                    Button(action: {
                        renouvel = true
                        
                    }, label: {
                        Text("Renouveler")
                            .foregroundColor(.white)
                            .padding()
                        
                    })
                    .background(.mint)
                    .cornerRadius(20)
                    .padding(.top, 30)
                    
                    Text("Abonnement expire le \(dateExpiration)")
                        .padding(.top, 30)
                        .padding(.bottom, 20)
                }
                
                .padding()
                .overlay(
                    Rectangle()
                        .stroke(darkestBlue, lineWidth: 1)
                )
                .background(customBlueLighter)
                
                Spacer()
                
                
                
                VStack(spacing: 0){
                    Button(action: {
                        edit = true
                    }, label: {
                        Text("Modifier")
                            .frame(width: 200)
                            .padding()
                            .foregroundColor(.white)
                    })
                    .background(customBlueDarker)
                    .cornerRadius(20)
                    
                    Button(action: {
                       dismiss()
                    }, label: {
                        Text("Retour")
                            .frame(width: 200)
                            .foregroundColor(.white)
                            .padding()
                        
                    })
                    .background(customBlueDarker)
                    .cornerRadius(20)
                    .padding()
                }
             
            }.onAppear {
                let id = UserDefaults.standard.integer(forKey: "userId")
                ClientViewModel().getClient(id: id) {
                           client in
                    
                    userId = client.id
                    userCourriel = client.courriel
                    userNom = client.nom
                    userPrenom = client.prenom
                    
                    
                       }
                
                AbonnementViewModel().getAbonnement(id: id){
                    abonnement in
                    dateExpiration = abonnement.dateFin
                }
            }
            
            .frame(maxWidth: .infinity)
            .background(LinearGradient(colors: [customBlue, customBlueLighter], startPoint: .top, endPoint: .bottom))
                
        }   .navigationBarBackButtonHidden(true)
        
        //        Spacer()
    }
//    private func loadData() {
//       
//          let id = UserDefaults.standard.integer(forKey: "userId")
//        ClientViewModel().getClient(id: id) {
//            client in
//            if let client = client {
//                
//            }
//        }
//          userNom = UserDefaults.standard.string(forKey: "userNom") ?? ""
//          userPrenom = UserDefaults.standard.string(forKey: "userPrenom") ?? ""
//          userCourriel = UserDefaults.standard.string(forKey: "userCourriel") ?? ""
//          
//      }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
