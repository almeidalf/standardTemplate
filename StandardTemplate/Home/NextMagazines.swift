//
//  NextMagazines.swift
//  StandardTemplate
//
//  Created by Felipe Almeida on 04/04/24.
//

import SwiftUI

struct NextMagazines: View {
  @State var image: String?
  @State var data: String?
  @State var subTitle: String?
  
  var body: some View {
    LazyVStack {
      VStack(alignment: .center) {
        Image(image ?? "page-1", bundle: .main)
          .resizable()
          .scaledToFit()
          .cornerRadius(8)
          .padding(.top, 8)
          .padding(.horizontal, 8)
        
        VStack(alignment: .leading) {
          Text(subTitle ?? "")
            .font(.caption)
            .foregroundStyle(.black)
            .lineLimit(1)
            .multilineTextAlignment(.leading)
          
          Text(data ?? "")
            .font(.caption)
            .foregroundStyle(.black)
            .lineLimit(1)
            .multilineTextAlignment(.leading)
        }
        .padding(.horizontal, 8)
        
        Spacer()
      }
    }
    .background(.white)
    .cornerRadius(8)
    .frame(width: 160)
  }
}

#Preview {
  NextMagazines()
}
