//
//  PaymentFooterView.swift
//  Brooke&Co
//
//  Created by Guilherme Cintra Castro on 2023-11-01.
//

import SwiftUI

struct PaymentFooterView: View {
//    @State var quantiteAPayer : Double
    var body: some View {
        VStack{
   
            // MARK: - TOTAL
//            HStack(spacing: 100){
//               
//                Text("Total avec taxes: ")
//                    .font(.title2)
//                
//                Text("\(String(format:"%.2f", quantiteAPayer)) $")
//                    .bold()
//                    .font(.title2)
//               
//            }.padding()
//                .background(customBlueLighter)
//                .frame(maxWidth: .infinity)
//                .overlay(
//                    Rectangle()
//                    
//                        .stroke(darkestBlue, lineWidth: 10)
//                    
//                )
            
            // MARK: - BUTTON PAYER
            HStack {
              
                Button(action: {}, label: {
                    Text("Payer avec paypal")
                    
                        .bold()
                        .font(.title2)
                        .padding(20)
                        .padding(.horizontal, 40)
                        .textCase(.uppercase)
                        .background(.yellow)
                        .cornerRadius(20)
                })
                
            }
            .frame(maxWidth: .infinity)
        }
        .padding( 20)
        .background(darkestBlue)
        .frame(maxWidth: .infinity)
       
       
    }
}

struct PaymentFooterView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentFooterView()
    }
}
