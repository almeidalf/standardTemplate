//
//  HomeResponse.swift
//  StandardTemplate
//
//  Created by Felipe Almeida on 04/04/24.
//

import Foundation

// MARK: - HomeResponse

struct HomeResponse: Hashable, Codable {
    let id: Int?
    let product, title, publisher, date, cover: String?
    let filename, category: String?
}
