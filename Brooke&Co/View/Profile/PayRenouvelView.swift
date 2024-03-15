//
//  PayRenouvelView.swift
//  Brooke&Co
//
//  Created by Charlie Leduc on 2023-12-12.
//

import SwiftUI

struct PayRenouvelView: View {
    @State var paymentSuccess = false
    var tarif = 100.00
    var body: some View {
        NavigationStack {
            
            // MARK: - NAVIGATIONS
            
            NavigationLink(destination: ProfileView(),isActive: $paymentSuccess, label: {
                
            })
            
            VStack(spacing:60) {
                
                HeaderView()
                
                // MARK: - PARAGRAPH
                Text("Renouvelez votre abonnement")
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
                        
                        AbonnementViewModel().payerAbonnementt(id: id)
                        
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


#Preview {
    PayRenouvelView()
}
