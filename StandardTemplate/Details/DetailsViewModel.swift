//
//  DetailsViewController.swift
//  StandardTemplate
//
//  Created by Felipe Almeida on 02/04/24.
//

import Foundation

final class DetailsViewModel: ObservableObject {
  @Published var detailText: String = "Initial Detail Text"
  
  func updateDetailText() {
    detailText = "Updated Detail Text"
  }
}
