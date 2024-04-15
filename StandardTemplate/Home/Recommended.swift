//
//  Recommended.swift
//  StandardTemplate
//
//  Created by Felipe Almeida on 05/04/24.
//

import SwiftUI

struct Recommended: View {
 @State var image: String?
 @State var title: String?
 @State var minutesReading: Int?
  
 var body: some View {
    VStack(alignment: .center) {
      ZStack(alignment: .topTrailing) {
        Image(image ?? "middleton", bundle: .main)
          .resizable()
          .scaledToFit()
          .clipShape(RoundedRectangle(cornerRadius: 8))
        
        Image("icon-caras", bundle: .main)
          .scaledToFit()
          .clipShape(RoundedRectangle(cornerRadius: 8))
          .frame(width: 40, height: 40)
          .padding(.top, 8)
          .padding(.trailing, 8)
      }
      
      VStack(alignment: .leading) {
        Text(title ?? "")
          .padding(.horizontal, 16)
          .multilineTextAlignment(.leading)
          .font(.subheadline)
          .bold()
          .lineLimit(3)
          .foregroundColor(UIColor(hexString: "#28302E").color)
        
        HStack {
          Text("Há \(minutesReading ?? 2) dias")
            .padding(.leading, 16)
            .font(.callout)
            .bold()
            .foregroundColor(UIColor(hexString: "#6B7874").color)
            .multilineTextAlignment(.leading)
        }
      }
    }
    .overlay(
      Rectangle()
        .stroke(lineWidth: 0.5)
        .cornerRadius(8)
    )
    .background(.white)
 }
}

#Preview {
  Recommended(image: "middleton", title: "TESTE", minutesReading: 7)
    .frame(width: 210, height: 300)
}
