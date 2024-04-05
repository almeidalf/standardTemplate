//
//  NextMagazines.swift
//  StandardTemplate
//
//  Created by Felipe Almeida on 04/04/24.
//

import SwiftUI

struct NextMagazines: View {
  var body: some View {
    LazyVStack {
      HStack {
        Image("page-1", bundle: .main)
          .resizable()
          .cornerRadius(8)
          .scaledToFit()
          .frame(width: 130, height: 110)
        
        VStack(alignment: .leading) {
          Text("chega em 02/05/24")
            .font(.subheadline)
            .foregroundStyle(.black)
          
          FillButtonView(image: UIImage(systemName: "hand.thumbsup.fill"), title: "Gostei", isEnabled: true) {
            print("clicou gostei")
          }
          .padding(.trailing, 16)
          
          FillButtonView(title: "Quero trocar") {
            print("clicou gostei")
          }
          .padding(.trailing, 16)
        }
        
        Spacer()
      }
    }
    .background(Color.gray)
    .cornerRadius(16)
    .padding(.horizontal, 16)
  }
}

#Preview {
  NextMagazines()
}
