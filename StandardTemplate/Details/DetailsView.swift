//
//  DetailsView.swift
//  StandardTemplate
//
//  Created by Felipe Almeida on 02/04/24.
//

import SwiftUI

struct DetailsView: View {
  @ObservedObject var viewModel = DetailsViewModel()
  
  @State var navigationTitle: String?
  @State var image: String?
  @State var title: String?
  @State var text: String?
  
  var body: some View {
    NavigationView {
      TabView {
        ForEach(viewModel.detailsResponse?.filter { $0.product == "News" } ?? [], id: \.self) { value in
          ScrollView(.vertical) {
            VStack {
              Image(value.meta?.first?.fileImage?.replacingOccurrences(of: ".png", with: "").replacingOccurrences(of: ".jpg", with: "") ?? "capa-1", bundle: .main)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.horizontal, 16)
                .frame(height: 200)
              
              Text(value.title ?? "")
                .font(.system(size: 16, design: .serif))
                .padding(.horizontal, 8)
                .padding(.top, 16)
              
              Divider()
                .frame(height: 1)
                .foregroundColor(.gray)
              
              Text(value.meta?.first?.abstract ?? "")
                .font(.system(size: 14, design: .serif))
                .padding(.horizontal, 16)
                .padding(.top, 16)
              
              Spacer()
              
              HStack(alignment: .center, spacing: 32) {
                Button(action: {
                }) {
                  Image(systemName: "hand.thumbsup")
                    .foregroundColor(.blue)
                }
                .frame(width: 50, height: 50)
                
                Button(action: {
                }) {
                  Image(systemName: "hand.thumbsdown")
                    .foregroundColor(.red)
                }
                .frame(width: 50, height: 50)
                
              }
              .padding(.horizontal, 16)
            }
          }
        }
      }
      .tabViewStyle(PageTabViewStyle())
    }
    .navigationBarTitle(navigationTitle ?? "Notícias", displayMode: .inline)
    .onAppear {
      viewModel.fetchData()
    }
  }
}
