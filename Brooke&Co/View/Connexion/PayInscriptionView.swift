//
//  PayInscriptionView.swift
//  Brooke&Co
//
//  Created by Guilherme Cintra Castro on 2023-10-27.
//

import SwiftUI

struct PayInscriptionView: View {
    @State var paymentSuccess = false
    var tarif = 100.00
    var body: some View {
        NavigationStack {
            
            // MARK: - NAVIGATIONS
            
            NavigationLink(destination: ClientHomeView(),isActive: $paymentSuccess, label: {
                
            })
            
            VStack(spacing:60) {
                
                HeaderView()
                
                // MARK: - PARAGRAPH
                Text("Payez le tarif pour compléter votre inscription")
                    .font(.footnote)
                    .foregroundColor(darkestBlue)
                // MARK: - ITEM
                Spacer()
                CartItemView()
                
                Spacer()
                
                // MARK: - TOTAL

                // MARK: - BUTTON PAYER
            
                    Spacer()
                    Button(action: {
                        
                        let id = UserDefaults.standard.integer(forKey: "userId")
                        
                        AbonnementViewModel().createAbonnement(id: id)
                        
                        paymentSuccess = true
                    }, label: {
                        Text("Payer avec paypal")

                            .bold()
                            .font(.title2)
                            .padding(20)
                            .padding(.horizontal, 40)
                            .textCase(.uppercase)
                            .foregroundColor(.white)
                            .background(customBlueDarker)
                            .cornerRadius(20)
                    })
                    .padding(20)
    //            PaymentFooterView()
    //                .padding(.top,100)
    //
    //
    //
    //
                    Spacer()
    //            }
                
    //            PaymentFooterView()
                    
               
            }.background(customBlue)
              
                .navigationBarBackButtonHidden(true)
        }
        
       
    }
}

struct PayInscriptionView_Previews: PreviewProvider {
    static var previews: some View {
        PayInscriptionView()
    }
}
