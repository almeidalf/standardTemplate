//
//  FillButtonView.swift
//  Copyright © 2024 Skeelo.
//

import SwiftUI

public struct FillButtonView: View {
  // MARK: - Variables
  
  let image: UIImage?
  let title: String
  let isEnabled: Bool
  var completionHandler: () -> Void

  // MARK: - Constructor

  public init(image: UIImage? = nil, title: String, isEnabled: Bool = true, completionHandler: @escaping (() -> Void)) {
    self.image = image
    self.title = title
    self.isEnabled = isEnabled
    self.completionHandler = completionHandler
  }

  // MARK: - Body

  public var body: some View {
    Button {
      completionHandler()
    } label: {
      ZStack {
        Rectangle()
          .foregroundColor(isEnabled ? Color("colorPrimary", bundle: .main) : .indigo)
          .cornerRadius(24)
          HStack {
            if let image {
              Image(uiImage: image)
            }

            Text(title)
              .font(.subheadline)
              .multilineTextAlignment(.center)
              .foregroundColor(.white)
          }
          .padding(.horizontal, 16)
      }
    }
    .foregroundColor(.red)
    .frame(height: 48)
  }
}

// MARK: - Previews

#Preview {
  ScrollView {
    FillButtonView(title: "Test", isEnabled: false) {
      print("clicked")
    }
  }
}
