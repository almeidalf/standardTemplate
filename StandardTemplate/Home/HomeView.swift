//
//  HomeView.swift
//  StandardTemplate
//
//  Created by Felipe Almeida on 04/04/24.
//

import SwiftUI

struct HomeView: View {
  @State var response: HomeResponse?
  
  var body: some View {
    VStack(alignment: .leading, spacing: 16) {
      RoundedRectangle(cornerRadius: 16)
        .fill(Color.gray)
        .frame(height: 140)
        .padding()
      
      Text("Jornais Hoje")
        .padding(.leading, 16)
        .font(.title2)
      
      ScrollView(.horizontal, showsIndicators: false) {
        LazyHStack(spacing: -8) {
          ForEach(response?.magazines ?? [], id: \.self) { values in
            NavigationLink(destination: PDFViewer(pdfName: values.pdfName ?? "")) {
              if let image = values.image {
                Image(image, bundle: .main)
                  .resizable()
                  .scaledToFit()
              }
            }
            .padding(.horizontal, 16)
          }
        }
      }
      .frame(height: 280)
      
      Text("Próximas revistas")
        .padding(.leading, 16)
        .font(.title2)
      
      ScrollView(.horizontal, showsIndicators: false) {
        LazyHStack(spacing: -8) {
          ForEach(response?.magazines ?? [], id: \.self) { values in
            NavigationLink(destination: PDFViewer(pdfName: values.pdfName ?? "")) {
              NextMagazines()
            }
          }
        }
      }
      .frame(height: 150)
      
      Spacer()
    }
    .onAppear {
      if let url = Bundle.main.url(forResource: "home-response", withExtension: "json") {
        do {
          let data = try Data(contentsOf: url)
          let decoder = JSONDecoder()
          response = try decoder.decode(HomeResponse.self, from: data)
        } catch {
          print("Error loading JSON: \(error)")
        }
      } else {
        print("File not found")
      }
    }
  }
}

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    HomeView()
  }
}
