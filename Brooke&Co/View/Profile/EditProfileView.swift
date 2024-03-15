//
//  EditProfileView.swift
//  Brooke&Co
//
//  Created by Guilherme Cintra Castro on 2023-11-02.
//

import SwiftUI

struct EditProfileView: View {
    @State var nom = "Blonde"
    @State var prenom = "Didi"
    @State var courriel = "dede.Blondie@ruskvi.ca"
    @State var motDePasse = "******"
    @State var confirmMotDePasse = "******"
    @State var errorM = ""
    @Environment(\.dismiss) var dismiss
    
    func verifieInput() -> Bool {
        if nom.isEmpty || prenom.isEmpty || courriel.isEmpty || motDePasse.isEmpty || confirmMotDePasse.isEmpty {
            errorM = "Veuillez remplir tous les champs"
            return false
        } else if motDePasse != confirmMotDePasse {
            errorM = "Les mots de passes ne sont pas parreils"
            return false
        }
        return true
    }
    
    
//    @FetchRequest( sortDescriptors: [NSSortDescriptor(keyPath: \ClientEntity.nom, ascending: true)])
//
//        var user : FetchedResults<ClientEntity>
   
    var body: some View {
        
        NavigationStack {
            VStack{
                HStack(spacing: 200){
                    
                    Button(action: {
                        dismiss()
                    }, label: {
                        Image(systemName: "arrowshape.backward.fill")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .foregroundColor(.black)
                    })
                    
                    
                    
                    NavigationLink(destination: CartView(), label: {  Image(systemName: "cart.fill")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.black)
                    }
                    )
                    
                 
                    
                }
                .padding(.top,20)
                .padding()
                
                VStack {
                    Image(systemName:"person.circle.fill")
                        .resizable()
                        .foregroundColor(.black)
                    .frame(width: 150, height: 150)
                    .padding()
                    
                    VStack {
                        Text("Indetifiction unique")
                            .foregroundColor(customBlueDarker)
                        Text("298749763")
                            .foregroundColor(customBlueDarker)
                    }
                   
                   
                    
                }
         
                VStack(alignment: .center)  {
                    VStack (alignment: .center){
                        HStack{
                            Spacer()
                            Text("Nom: ")
                                .padding(0)
                            TextField("", text: $nom)
                                .padding(0)
                           
                                
                        }.padding(0)
                        
                        HStack{
                            Spacer()
                            Text("Prenom: ")
                                .padding(0)
                            TextField("", text: $prenom)
                                .padding(0)
                        }
                        
                        HStack{
                            Spacer()
                            Text("Courriel: ")
                                .padding(0)
                            TextField("", text: $courriel)
                                .padding(0)
                        }
                        

                        HStack{
                            Spacer()
                            Text("Mot de passe: ")
                                .padding(0)
                            SecureField("", text: $motDePasse)
                                .padding(0)
                        }
                        
                        HStack{
                            Spacer()
                            Text("Confirmer mot de passe: ")
                                .padding(0)
                            SecureField("", text: $confirmMotDePasse)
                                .padding(0)
                        }
                    }
                    .padding(.top, 20)
               
                        .padding(.bottom, 20)
                }
                
                .padding()
                .overlay(
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(Color.gray, lineWidth: 1)
                               
                        )
                        .shadow(color: .gray, radius: 5, x: 0, y: 2)
                        
                Spacer()
                
         
                Text("\(errorM)")
                    .font(.caption2)
                    .foregroundStyle(.red)
                
                VStack(spacing: 20){
                    Button(action: {
                        
                        if verifieInput() {
                            
                            let id = UserDefaults.standard.integer(forKey: "userId")
                                ClientViewModel().updateClient(id: id, nom: nom, prenom: prenom, courriel: courriel, motDePasse: motDePasse)

                            dismiss()
                        }
                        
                    }, label: {
                        Text("Appliquer")
                            .frame(width: 200)
                            .padding()
                            .foregroundColor(.white)
                    })
                    .background(customBlueDarker)
                    .cornerRadius(20)
                    
                    Button(action: {
                        dismiss()
                    }, label: {
                        Text("Annuler")
                            .frame(width: 200)
                            .padding()
                            .foregroundColor(.white)
                    })
                    .background(customBlueDarker)
                    .cornerRadius(20)
                    
                   
                  
                }
            }
            .onAppear {
                let id = UserDefaults.standard.integer(forKey: "userId")
                ClientViewModel().getClient(id: id) {client in
                    
                    nom  = client.nom
                    prenom = client.prenom
                    courriel = client.courriel
                    motDePasse = client.password
                    confirmMotDePasse = client.password
                }
                
                
               
                
                
            }
            .frame(maxWidth: .infinity)
            .background(LinearGradient(colors: [customBlue, customBlueLighter], startPoint: .top, endPoint: .bottom))
                
               
        }   .navigationBarBackButtonHidden(true)
          

    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
//            .environment(\.managedObjectContext, DataController.preview.container.viewContext)
    }
}
