//
//  DetailsResponse.swift
//  StandardTemplate
//
//  Created by Felipe Almeida on 05/04/24.
//

import Foundation

// MARK: - Detail
struct DetailsResponse: Hashable, Codable {
  let id: Int?
  let product, title: String?
  let meta: [Meta]?
  let publisher, date, filename, cover: String?
  let category: String?
  let favorite: Int?
}

// MARK: - Meta
struct Meta: Hashable, Codable {
  let title, abstract, fileImage: String?
  
  enum CodingKeys: String, CodingKey {
    case title, abstract
    case fileImage = "file_image"
  }
}
