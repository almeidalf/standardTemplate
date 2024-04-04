//
//  DetailsVIew.swift
//  StandardTemplate
//
//  Created by Felipe Almeida on 02/04/24.
//

import SwiftUI

struct DetailsView: View {
  @ObservedObject var viewModel = DetailsViewModel()
  
  var body: some View {
    VStack {
      if let pokemon = viewModel.pokemon {
        Text("Name: \(pokemon.name)")
        Text("Height: \(pokemon.height)")
        Text("Weight: \(pokemon.weight)")
      } else {
        Text("Loading...")
      }
      
      Button("Fetch Pokemon") {
        viewModel.fetchData()
      }
    }
  }
}
