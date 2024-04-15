//
//  HomeView.swift
//  StandardTemplate
//
//  Created by Felipe Almeida on 04/04/24.
//

import SwiftUI

struct HomeView: View {
  @ObservedObject var viewModel = HomeViewModel()
  @State var response: [HomeResponse]?
  
  var body: some View {
    ScrollView(.vertical) {
      Spacer(minLength: 64)
      
      VStack(alignment: .leading, spacing: 16) {
        Image("banner", bundle: .main)
          .resizable()
          .scaledToFit()
        
        Text("Jornais Hoje")
          .padding(.leading, 16)
          .font(.title2)
          .bold()
          .foregroundColor(.white)
        
        ScrollView(.horizontal, showsIndicators: false) {
          LazyHStack(spacing: -8) {
            ForEach(viewModel.getNews ?? [], id: \.self) { value in
              NavigationLink(destination: PDFViewer(pdfName: value.filename ?? "")) {
                if let image = value.cover?.replacingOccurrences(of: ".png", with: "") {
                  VStack {
                    VStack(alignment: .leading) {
                      Image(image, bundle: .main)
                        .resizable()
                        .scaledToFit()
                        .background(.white)
                        .padding(.horizontal, 8)
                        .padding(.top, 8)
                      
                      Text(value.publisher?.description ?? "")
                        .font(.footnote)
                        .foregroundColor(.black)
                        .padding(.horizontal, 8)
                        .padding(.bottom, 8)
                    }
                  }
                  .background(.white)
                }
              }
              .cornerRadius(8)
              .padding(.horizontal, 16)
            }
          }
        }
        .frame(height: 280)
        
        Text("Revistas disponíveis para você")
          .padding(.leading, 16)
          .font(.title2)
          .bold()
          .foregroundColor(.white)
        
        ScrollView(.horizontal, showsIndicators: false) {
          LazyHStack(spacing: -8) {
            ForEach(viewModel.getMagazine ?? [], id: \.self) { value in
              NavigationLink(destination: PDFViewer(pdfName: value.filename ?? "")) {
                NextMagazines(
                  image: value.cover?.replacingOccurrences(of: ".png", with: ""),
                  data: value.date,
                  subTitle: value.publisher
                )
              }
            }
            .padding(.horizontal, 16)
          }
        }
        .frame(height: 250)
        
        VStack {
          HStack {
            Text("Recomendações")
              .padding(.leading, 16)
              .font(.title2)
              .bold()
              .foregroundColor(.black)
            
            Spacer()
            
            Button("Ver mais") {
              
            }
            .foregroundColor(UIColor(hexString: "#6B7874").color)
            .padding(.trailing, 16)
          }
          .padding(.vertical, 16)
          
          ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 8) {
              ForEach(viewModel.getMagazine ?? [], id: \.self) { value in
                Recommended(image: value.cover?.replacingOccurrences(of: ".png", with: ""), title: value.title, minutesReading: value.id)
                  .frame(width: 150)
                  .padding(.bottom, 16)
              }
              .padding(.horizontal, 16)
            }
          }
        }
        .background(.white)
        .frame(maxHeight: .infinity)
        Spacer(minLength: bottomSafeArea + 32)
      }
      .onAppear {
        viewModel.fetchHome()
      }
    }
    .background(UIColor(hexString: "#224C7A").color)
    .ignoresSafeArea(.container)
  }
}

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    HomeView()
  }
}
