//
//  CartItemView.swift
//  Brooke&Co
//
//  Created by Guilherme Cintra Castro on 2023-11-01.
//

import SwiftUI

struct CartItemView: View {
    
    var body: some View {
        HStack(spacing: 50) {
            
            // MARK: - IMAGE
            Image(systemName: "newspaper")
                .resizable()
            .frame(width: 100, height: 100)
            .foregroundColor(goldColor)
            .padding()
            
            // MARK: - INFO ITEM
            VStack(alignment: .leading) {
                
                Text("Abonnement")
                    .font(.title2)
                    .foregroundColor(.white)
                    .bold()
                    .font(.system(size: 20))
                HStack {
                    Text("Prix:")
                        .foregroundColor(.white)
                        .font(.system(size: 20))
                    Text("100.00 $")
                        .foregroundColor(.white)
                        .font(.system(size: 20))
                        .bold()
                }
//                Text("En stock")
//                HStack {
//                    Text("Quantité:")
//                    
//                    HStack {
//                        Text("1")
//                        HStack(spacing:0) {
//                            Button(action: {}, label: {
//                                Image(systemName: "plus.app")
//                                    .foregroundColor(.black)
//                                    .opacity(0.5)
//                                    
//                            })
//                            
//                            Button(action: {}, label: {
//                                Image(systemName: "minus.square")
//                                    .foregroundColor(.black)
//                                    .opacity(0.5)
//                            })
//                        }
//                        
//                        
//                    }
//                    
//                    
//                }
            }
        }
        .padding()
        .background(customBlueDarker)
       
        .overlay(
            Rectangle()
                
                .stroke(darkestBlue, lineWidth: 5)
               
        )
       
    }
}

struct CartItemView_Previews: PreviewProvider {
    static var previews: some View {
        CartItemView()
    }
}
