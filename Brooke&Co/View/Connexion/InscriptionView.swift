//
//  InscriptionView.swift
//  Brooke&Co
//
//  Created by Guilherme Cintra Castro on 2023-10-27.
//

import SwiftUI

struct InscriptionView: View {
//    @Environment(\.managedObjectContext) var moc
    @State var nom = ""
    @State var prenom = ""
    @State var courriel = ""
    @State var confimerCourriel = ""
    @State var password = ""
    @State var confimerPass = ""
    @State var errorMsg = ""
    @State var allerPayer = false
    
    @Environment(\.dismiss) var dismiss
    
    func verifieInfos() -> Bool {
        if nom.isEmpty || prenom.isEmpty || courriel.isEmpty || confimerCourriel.isEmpty || password.isEmpty || confimerPass.isEmpty {
            errorMsg = "Veuillez remplir tous les champs"
            return false
        } else if password != confimerPass{
            errorMsg = "Les deux mots de passes ne sont pas parreils"
            return false
        }
        
        else if courriel != confimerCourriel{
            errorMsg = "Les deux courriels ne sont pas parreils"
            return false
        } else {
            
            return true
        }
    }
    
    var body: some View {
        NavigationStack {
            NavigationLink(destination: PayInscriptionView(),isActive: $allerPayer, label: {})
            
            VStack(alignment: .center) {
                
                HeaderView()
                Text("Inscription")
                    .font(.title)
                    .textCase(.uppercase)
                    .foregroundColor(customBlueDarker)
               Spacer()
                VStack(spacing: 15){
                    TextField("Nom", text: $nom)
                        .padding(10)
                        .frame(width: 350)
                        .foregroundColor(.black)
                        .background(customBlueLighter)
                        .cornerRadius(10)
                    
                    TextField("Prénom", text: $prenom)
                        .padding(10)
                        .frame(width: 350)
                        .foregroundColor(.black)
                        .background(customBlueLighter)
                        .cornerRadius(10)
                    
                    TextField("Courriel", text: $courriel)
                        .padding(10)
                        .frame(width: 350)
                        .foregroundColor(.black)
                        .background(customBlueLighter)
                        .cornerRadius(10)
                    
                    TextField("Confimez votre courriel", text: $confimerCourriel)
                        .padding(10)
                        .frame(width: 350)
                        .foregroundColor(.black)
                        .background(customBlueLighter)
                        .cornerRadius(10)
                    
                    SecureField("Mot de passe", text: $password)
                        .padding(10)
                        .frame(width: 350)
                        .foregroundColor(.black)
                        .background(customBlueLighter)
                        .cornerRadius(10)
                    
                    SecureField("Confirmez votre de passe", text: $confimerPass)
                        .padding(10)
                        .frame(width: 350)
                        .foregroundColor(.black)
                        .background(customBlueLighter)
                        .cornerRadius(10)

                }
                
                Text("\(errorMsg)")
                    .foregroundStyle(.red)
                    .font(.caption2)
                    .padding()
//                Spacer()
                
                // MARK: - BUTTON
                Button(action: {
                    if verifieInfos() {
                        ClientViewModel().registerUser(nom: nom, prenom: prenom,courriel: courriel, password: password, completion: { client in
                            guard let client = client, client.id > 0 else {
                              
                                return
                            }
                            UserDefaults.standard.set(client.id, forKey: "userId")
                                   UserDefaults.standard.set(client.nom, forKey: "userNom")
                                   UserDefaults.standard.set(client.prenom, forKey: "userPrenom")
                                   UserDefaults.standard.set(client.courriel, forKey: "userCourriel")
                                   UserDefaults.standard.set(true, forKey: "isLoggedIn")
                            UserDefaults.standard.set(client.password, forKey: "userPassword")
                      
                            
                            allerPayer = true
                        }, onError: { error in
                            errorMsg = error
                        })
                        allerPayer = true
                    }
                 
                },
                       label: {
                    Text("Incription")
                        .foregroundColor(.white)
                        .frame(width: 200)
                        .textCase(.uppercase)
                        .padding()
                    
                })
                .background(customBlueDarker)
                .cornerRadius(20)
                
                Button(action: {
                    dismiss()
                }, label: {
                    HStack(spacing: 1) {
                        Text("Vous avez déjà un compte?")
                            .font(.system(size: 20))
                        Text("Cliquez ici")
                            .bold()
                    } 
                    
                }).padding()
                Spacer()
            }
            .background(customBlue)
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct InscriptionView_Previews: PreviewProvider {
    static var previews: some View {
        InscriptionView().environment(\.managedObjectContext, DataController.preview.container.viewContext)
    }
}
