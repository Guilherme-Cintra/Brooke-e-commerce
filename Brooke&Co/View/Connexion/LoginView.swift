//
//  LoginView.swift
//  Brooke&Co
//
//  Created by Guilherme Cintra Castro on 2023-10-27.
//

import SwiftUI

struct LoginView: View {
    @Environment(\.managedObjectContext) var moc
    @State var username = ""
    @State var password = ""
    @State var estConnecte = false
    @State var inscriptionClick = false
    @State var gestionClick = false
    @State var errorMessage = ""

    
//    func verifieConnexion(courriel: String, password: String, tabClient: [Client]) -> Bool {
//        for client in tabClient {
//            if client.courriel.lowercased() == courriel.lowercased() && client.password == password {
//                errorMessage = ""
//                return true
//            }
//        }
//        errorMessage = "Courriel ou mot de passe incorrect"
//        return false
//    }

    
    
    var body: some View {
        NavigationStack {
            
            // MARK: - NAVIGATIONS
            
            NavigationLink(destination: InscriptionView(),isActive: $inscriptionClick , label: {})
            NavigationLink(destination: GestionnaireLoginView(),isActive: $gestionClick , label: {})
            
            
            
            
            VStack(alignment:.center){
                    
                    HeaderView()
                    
                        
                  
                VStack(spacing:40) {
                    Text("Connectez-vous")
                        .font(.title)
                    
                    
                    // MARK: - TextFields
                    VStack(spacing:30) {
                        TextField("Nom d'utilisateur", text: $username)
                                .padding()
                                .frame(width: 250)
                                .foregroundColor(darkestBlue)
                                .background(customBlueLighter)
                        
                        
                            .cornerRadius(30)
                        
                        SecureField("Mot de passe", text: $password)
                            .padding()
                            .frame(width: 250)
                            .foregroundColor(.black)
                            .background(customBlueLighter)
                        .cornerRadius(30)
                        
                       
                            Text(errorMessage)
                                .foregroundColor(.red)
                                .font(.caption)
                        
                    }
                    
                  
                    // MARK: - Bouton connexion
                    Button(action: {
                        ClientViewModel().loginUser(courriel: username, password: password, completion: { client in
                            guard let client = client, client.id > 0 else {
                                errorMessage = "Courriel et/ou mot de passe incorrect(s)"
                                return
                            }
                            
                            UserDefaults.standard.set(client.id, forKey: "userId")
                                   UserDefaults.standard.set(client.nom, forKey: "userNom")
                                   UserDefaults.standard.set(client.prenom, forKey: "userPrenom")
                                   UserDefaults.standard.set(client.courriel, forKey: "userCourriel")
                                   UserDefaults.standard.set(true, forKey: "isLoggedIn")
                            UserDefaults.standard.set(client.password, forKey: "userPassword")
                            
                            estConnecte = true
                        }, onError: { error in
                            errorMessage = error
                        })
                    }, label: {
                        Text("Connexion")
                            .foregroundColor(.white)
                            .textCase(.uppercase)
                            .padding(.vertical,20)
                            .frame(width: 200)
                           
                    })
                    .background(customBlueDarker)
                    .cornerRadius(20)
                    
                    NavigationLink(destination: ClientHomeView(),isActive: $estConnecte, label: {
                    })
                    
                    // MARK: - Gestionnaire/inscriptions
                    VStack(spacing:20) {
                        HStack(spacing:2) {
                            Text("Gestionnaire?")
                                .font(.system(size: 20))
                            Text("Cliquez ici")
                                .font(.system(size: 20))
                                .bold()
                        }.foregroundColor(darkestBlue)
                            .onTapGesture {
                                gestionClick = true
                            }
                        HStack(spacing:2) {
                            Text("Vous n'avez pas de compte?")
                                .font(.system(size: 15))
                            Text("Inscrivez vous")
                                .font(.system(size: 15))
                                .bold()
                        }.foregroundColor(darkestBlue)
                            .onTapGesture {
                                inscriptionClick = true
                            }
                    }
                    
                  
                    
                }
                
                
                    Spacer()
                }
            .background(customBlue)
            .navigationBarBackButtonHidden(true)
        }
        
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView().environment(\.managedObjectContext, DataController.preview.container.viewContext)
    }
}
