//
//  ListCommandeView.swift
//  ProjectInterfaces
//
//  Created by Rafael Castro on 2023-11-05.
//

import SwiftUI

struct ListCommandeView: View {
    
    @Environment(\.dismiss) var dismiss
    @State var listeCommandes = [CommandeResponse]()
    @State var etat: String = "Éxpedié"
    

    var body: some View {
        VStack(spacing:20) {
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
            
          
            Text("Liste de commandes")
                .font(.title)
                .textCase(.uppercase)
                .foregroundStyle(.white)
                .padding()
                .background(customBlueDarker)
                .cornerRadius(30)
                .foregroundColor(.white)
            
            VStack{
                List {

                    ForEach(listeCommandes, id: \.numero){commande in
                        VStack(alignment:.leading) {
                            Text("Numéero : \(commande.numero)")
                            Text("Date : \(commande.date)")
                            Text("ID du client : \(commande.idClient)")
                            Text("État de la commande : \(commande.etat.capitalized)").foregroundStyle(commande.etat == "payé" ? .red : .secondary)
                            
                        }
                        HStack {
                            Spacer()
                            Button(action: {
                                CommandeViewModel().expedierCommande(commande: commande)
                                CommandeViewModel().getCommandes{
                                    (commandes) in
                                    
                                    listeCommandes = commandes
                                }
                            }, label: {
                                Text("EXPÉDIER")
                                    .padding()
                                    .background( customBlue)
                                    .cornerRadius(8.0)
                            })
                            Spacer()
                        }
                     
                    }
                }.frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(customBlue)
                    .onAppear(){
                        CommandeViewModel().getCommandes{
                            (commandes) in
                            
                            listeCommandes = commandes
                        }
                    }
                    .listStyle(.sidebar)
            }
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(customBlue)
        .navigationBarBackButtonHidden(true)
       
    }
    

}

struct ListCommandeView_Previews: PreviewProvider {
    static var previews: some View {
        ListCommandeView()
    }
}
