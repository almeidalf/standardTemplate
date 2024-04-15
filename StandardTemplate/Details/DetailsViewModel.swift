//
//  DetailsViewController.swift
//  StandardTemplate
//
//  Created by Felipe Almeida on 02/04/24.
//

import Foundation

final class DetailsViewModel: ObservableObject {
  @Published var detailsResponse: [DetailsResponse]?
  @Published var navigationTitle: String?
  
  func fetchData() {
    guard let url = URL(string: "http://192.168.68.136:3000/news/details") else {
      return
    }
    
    let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
      guard let data = data, error == nil else {
        print("Error fetching data: \(error?.localizedDescription ?? "Unknown error")")
        return
      }
      
      do {
        let decodedData = try JSONDecoder().decode([DetailsResponse].self, from: data)
        DispatchQueue.main.async {
          self?.detailsResponse = decodedData
        }
      } catch {
        print("Error decoding data: \(error.localizedDescription)")
      }
    }
    
    task.resume()
  }
}
