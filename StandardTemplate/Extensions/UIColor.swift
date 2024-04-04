//
//  UIColor.swift
//  StandardTemplate
//
//  Created by Felipe Almeida on 02/04/24.
//

import SwiftUI

public extension UIColor {
  convenience init(hexString: String) {
    let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
    var int = UInt64()
    Scanner(string: hex).scanHexInt64(&int)
    let a, r, g, b: UInt64
    switch hex.count {
      case 3: // RGB (12-bit)
        (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
      case 6: // RGB (24-bit)
        (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
      case 8: // ARGB (32-bit)
        (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
      default:
        (a, r, g, b) = (255, 0, 0, 0)
    }
    self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
  }

  convenience init(red: Int, green: Int, blue: Int) {
    assert(red >= 0 && red <= 255, "Invalid red component")
    assert(green >= 0 && green <= 255, "Invalid green component")
    assert(blue >= 0 && blue <= 255, "Invalid blue component")
    self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
  }

  var hexString: String {
    let components = cgColor.components
    let red: CGFloat = components?[0] ?? 0.0
    let green: CGFloat = components?[safe: 1] ?? 0.0
    let blue: CGFloat = components?[2] ?? 0.0

    let hexString = String(
      format: "#%02lX%02lX%02lX",
      lroundf(Float(red * 255)),
      lroundf(Float(green * 255)),
      lroundf(Float(blue * 255))
    )

    return hexString
  }

  var color: Color {
    Color(self)
  }
}

