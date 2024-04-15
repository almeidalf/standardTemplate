//
//  HomeViewModel.swift
//  StandardTemplate
//
//  Created by Felipe Almeida on 04/04/24.
//

import Foundation

final class HomeViewModel: ObservableObject {
  @Published var response: [HomeResponse]?
  
  var getNews: [HomeResponse]? {
    var news: [HomeResponse] = []
    
    response?.forEach { value in
      if value.product == "News" {
        news.append(value)
      }
    }
    
    return news
  }
  
  var getMagazine: [HomeResponse]? {
    var magazine: [HomeResponse] = []
    
    response?.forEach { value in
      if value.product == "Magazine" {
        magazine.append(value)
      }
    }
    
    return magazine
  }
  
//  func fetchHome() {
//    guard let url = URL(string: "http://192.168.68.136:3000/news/home") else {
//      return
//    }
//    
//    let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
//      guard let data = data, error == nil else {
//        print("Error fetching data: \(error?.localizedDescription ?? "Unknown error")")
//        return
//      }
//      
//      do {
//        let decodedData = try JSONDecoder().decode([HomeResponse].self, from: data)
//        DispatchQueue.main.async {
//          self?.response = decodedData
//        }
//      } catch {
//        print("Error decoding data: \(error.localizedDescription)")
//      }
//    }
//    
//    task.resume()
//  }
  
  func fetchHome() {
    guard let url = Bundle.main.url(forResource: "home-response", withExtension: "json") else {
      print("Error: home-response.json not found in bundle")
      return
    }
    
    do {
      let data = try Data(contentsOf: url)
      let decodedData = try JSONDecoder().decode([HomeResponse].self, from: data)
      response = decodedData
    } catch {
      print("Error decoding data: \(error.localizedDescription)")
    }
  }
  
  @objc func customButtonTapped() {
    print("Custom button tapped!")
  }
}
