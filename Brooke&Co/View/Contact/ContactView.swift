//
//  ContactView.swift
//  Brooke&Co
//
//  Created by Guilherme Cintra Castro on 2023-11-02.
//

import SwiftUI

struct ContactView: View {
    @Environment(\.dismiss) var dismiss
    @State var cartClick = false
    var body: some View {
        NavigationStack {
            NavigationLink(destination: CartView(),isActive: $cartClick, label: {})
            VStack {
                HStack (spacing: 30){
                    Button(action: {
                        dismiss()
                    }, label: {
                        Image(systemName: "arrowshape.backward.fill")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.black)
                    })
                    
                    Image("Logo")
                    
           
                   Button(action: {cartClick = true
                       
                   }, label: {
                       Image(systemName: "cart.fill")
                           .resizable()
                           .frame(width: 50, height: 50)
                           .foregroundColor(.black)
                   })
                }
                .padding(.top, 50)
                .padding(.horizontal, 30)
                
                Text("Où nous trouver")
                    .font(.callout)
                    .padding(.bottom, 30)

                VStack {
                    MapView(location:"81 Rue Saint-Viateur Est, Montréal, QC H2T 1A7 Canada")
                        .background(customBlueDarker)
                        .cornerRadius(30)
                        .frame(width: 350, height: 350)
                        .overlay(
                                    RoundedRectangle(cornerRadius: 30)
                                        .stroke(Color.gray, lineWidth: 1)
                                )
                                .shadow(color: .gray, radius: 5, x: 0, y: 2)
                    
                            .padding(.bottom, 40)
                }
             
                Text("Trouvez la surcursale la plus proche de chez vous")
                    .font(.callout)
                
                Button(action: {}, label: {
                    Text("Trouver")
                        .frame(width: 200)
                        .padding()
                        .textCase(.uppercase)
                        .foregroundColor(.white)
                })
                .background(customBlueDarker)
                .cornerRadius(20)
                .padding(.top, 20)
                
                
                Spacer()
            }.background(customBlue)
                .navigationBarBackButtonHidden(true)
        }
    }
}

struct ContactView_Previews: PreviewProvider {
    static var previews: some View {
        ContactView()
    }
}
