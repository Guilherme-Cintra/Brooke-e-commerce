//
//  GestionnaireAcceuilView.swift
//  Brooke&Co
//
//  Created by Guilherme Cintra Castro on 2023-11-06.
//

import SwiftUI

struct GestionnaireAcceuilView: View {
    var body: some View {
        NavigationView {
            VStack(spacing:10){
                HStack {

                    Image("Logo")

                }
                
                Text("Bienvenue")
                    .font(.title)
                    .bold()

                VStack(spacing:15) {
                    NavigationLink(destination: AjouterLivreView()) {
                        Text("Ajouter un livre")
                            .bold()
                            .font(.callout)
                            .textCase(.uppercase)
                    }
                    .bold()
                    .frame(width: 300,height: 50)
                    .foregroundColor(.white)
                    .background(darkestBlue)
                    .cornerRadius(30)


                    NavigationLink(destination: AjouterFilmView()) {
                        Text("Ajouter un film")
                            .bold()
                            .font(.callout)
                            .textCase(.uppercase)
                    }
                    .bold()
                    .frame(width: 300,height: 50)
                    .foregroundColor(.white)
                    .background(darkestBlue)
                    .cornerRadius(30)

                    NavigationLink(destination: AjouterJeuView()) {
                        Text("Ajouter un jeu")
                            .bold()
                            .font(.callout)
                            .textCase(.uppercase)
                    }
                    .bold()
                    .frame(width: 300,height: 50)
                    .foregroundColor(.white)
                    .background(darkestBlue)
                    .cornerRadius(30)

                    NavigationLink(destination: AjouterStockView()) {
                        Text("Ajouter des \nnouveaux stocks")
                            .bold()
                            .font(.callout)
                            .textCase(.uppercase)
                    }
                    .bold()
                    .frame(width: 300,height: 50)
                    .foregroundColor(.white)
                    .background(darkestBlue)
                    .cornerRadius(30)

//                    NavigationLink(destination: ListCommandeView()) {
//                        Text("Afficher liste\ndes commandes")
//                    }
//                    .bold()
//                    .frame(width: 300,height: 60)
//                    .foregroundColor(.white)
//                    .background(customBlueDarker)
//                    .cornerRadius(30)

                    NavigationLink(destination: VoirProduitsView()) {
                        Text("Voir les produits")
                            .bold()
                            .font(.callout)
                            .textCase(.uppercase)
                    }
                    .bold()
                    .frame(width: 300,height: 50)
                    .foregroundColor(.white)
                    .background(darkestBlue)
                    .cornerRadius(30)

                    NavigationLink(destination: AfficherStockView()) {
                        Text("Afficher stocks")
                            .bold()
                            .font(.callout)
                            .textCase(.uppercase)
                    }
                    .bold()
                    .frame(width: 300,height: 50)
                    .foregroundColor(.white)
                    .background(darkestBlue)
                    .cornerRadius(30)

                    NavigationLink(destination: ListCommandeView()) {
                        Text("Afficher les commandes")
                            .bold()
                            .font(.callout)
                            .textCase(.uppercase)
                    }
                    .bold()
                    .frame(width: 300,height: 50)
                    .foregroundColor(.white)
                    .background(darkestBlue)
                    .cornerRadius(30)
                }
                .padding()
                .background(customBlueLighter)
                .cornerRadius(20)


                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(customBlue)

        }.navigationBarBackButtonHidden(true)
    }
}

//#Preview {
//    GestionnaireAcceuilView()
//}
//
struct GestionnaireAcceuilView_Previews: PreviewProvider {
    static var previews: some View {
        GestionnaireAcceuilView()
    }
}
