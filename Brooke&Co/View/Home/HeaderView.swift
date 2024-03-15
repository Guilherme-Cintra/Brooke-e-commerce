//
//  HeaderView.swift
//  Brooke&Co
//
//  Created by Guilherme Cintra Castro on 2023-10-27.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        VStack{
            Image("Logo")
            
        }
     
        .padding()
        .padding(.horizontal, 200)
        .padding(.top, 20)
        .background(customBlue)
        
      
    }
       
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
