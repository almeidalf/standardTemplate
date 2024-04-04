//
//  Collection.swift
//  StandardTemplate
//
//  Created by Felipe Almeida on 02/04/24.
//

import UIKit

public extension Collection {
  subscript(safe index: Index) -> Element? {
    indices.contains(index) ? self[index] : nil
  }
}
