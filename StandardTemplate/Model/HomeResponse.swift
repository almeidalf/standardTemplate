//
//  HomeResponse.swift
//  StandardTemplate
//
//  Created by Felipe Almeida on 04/04/24.
//

import Foundation

// MARK: - HomeResponse

struct HomeResponse: Codable {
  let newspapper: [Item]?
  let magazines: [Item]?
  
  init(newspapper: [Item]? = nil, magazines: [Item]? = nil) {
    self.newspapper = newspapper
    self.magazines = magazines
  }
}

// MARK: - Item

struct Item: Hashable, Codable {
  let id: Int?
  let title, subTitle, image, pdfName: String?
  let category: String?
  let publisher: String?
  let numberRead: Int?
}
