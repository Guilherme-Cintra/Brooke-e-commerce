//
//  CommandeView.swift
//  Brooke&Co
//
//  Created by Guilherme Cintra Castro on 2023-11-08.
//

import SwiftUI

struct CommandeView: View {
    var commande : CommandeResponse
    @State var status = ""
    var body: some View {
        VStack(alignment: .leading) {
            Text("Numéro : \(commande.numero)")
                .font(.title)
                .textCase(.uppercase)
            VStack(alignment: .leading){
                Text("Date : \(commande.date)")
                    .textCase(.uppercase)
                Text("ID du client : \(commande.idClient)")
                    .textCase(.uppercase)
                Text("État : \(status)")
                    .textCase(.uppercase)
            }
            
            Button(action: {
//                if self.commande.etat == "Payé" {
////                    self.commande.etat = "Expédié"
//                    status = commande.etat
//                }
            }, label: {
                Text(commande.etat == "Payé" ? "À EXPÉDIER" : "EXPÉDIÉ")
                    .font(.title)
                    .padding(10)
                    .frame(width: 200)
            })
            .background(commande.etat == "Payé" ? .white : darkestBlue )
            .cornerRadius(20)
            
            
        }
        .onAppear(){
            status = commande.etat
        }
        .frame(width: 300)
        .padding()
        .background(customBlueLighter)
        .cornerRadius(30)
        .overlay(
                    RoundedRectangle(cornerRadius: 30)
                        
                        .stroke(customBlueDarker, lineWidth: 3)
                       
                )
                .shadow(color: .gray, radius: 5, x: 0, y: 2)
    }
}

//#Preview {
//    CommandeView(commande: Commande(numero: 2, date: "10/11/1998", idClient: 2, etat: "Payé"))
//}
struct CommandeView_Previews: PreviewProvider {
    static var previews: some View {
        CommandeView(commande:CommandeResponse(numero: 1, date: "20-20-2002", idClient: 1, etat: "Payé"))
    }
}
