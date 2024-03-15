//
//  GestionnaireLoginView.swift
//  Brooke&Co
//
//  Created by Guilherme Cintra Castro on 2023-11-07.
//

import SwiftUI

struct GestionnaireLoginView: View {
    @State var username = ""
    @State var password = ""
    @State var estConnecte = false
    @State var inscriptionClick = false
    @State var errorMessage = ""
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack {
            
            // MARK: - NAVIGATIONS
            
            NavigationLink(destination: InscriptionView(),isActive: $inscriptionClick , label: {})
            
            
            
            
            VStack(alignment:.center){
                    
                // MARK: - HEADER
                
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
                    
                        
                  
                VStack(spacing:80) {
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
                    }
                    
                  
                    Text("\(errorMessage)")
                        .foregroundStyle(.red)
                        .font(.caption2)
                    
                    // MARK: - Bouton connexion
                    Button(action: {
                        GestionnaireViewModel().loginGestionnaire(courriel: username.lowercased(), password: password, completion: {
                            gestionnaire in
                            
                            guard let gestionnaire = gestionnaire, gestionnaire.id > 0 else {
                            
                                return
                            }
                            estConnecte = true
                            print("\(gestionnaire)")
                        }, onError: {
                            
                            error in
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
                    
                    NavigationLink(destination: GestionnaireAcceuilView(),isActive: $estConnecte, label: {

                    })
                    
              
                    
                  
                    
                }
                
                
                    Spacer()
                }
            .frame(maxWidth: .infinity)
            .background(customBlue)
        }.navigationBarBackButtonHidden(true)
        
        
    }
}

//#Preview {
//    GestionnaireLoginView()
//}
struct GestionnaireLoginView_Previews: PreviewProvider {
    static var previews: some View {
        GestionnaireLoginView()
    }
}
