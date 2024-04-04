//
//  DetailsViewController.swift
//  StandardTemplate
//
//  Created by Felipe Almeida on 02/04/24.
//

import Foundation

final class DetailsViewModel: ObservableObject {
  @Published var pokemon: Pokemon?
  
  func fetchData() {
    guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon/ditto") else {
      return
    }
    
    let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
      guard let data = data, error == nil else {
        print("Error fetching data: \(error?.localizedDescription ?? "Unknown error")")
        return
      }
      
      do {
        let decodedData = try JSONDecoder().decode(Pokemon.self, from: data)
        DispatchQueue.main.async {
          self?.pokemon = decodedData
        }
      } catch {
        print("Error decoding data: \(error.localizedDescription)")
      }
    }
    
    task.resume()
  }
}
