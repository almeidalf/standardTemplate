//
//  MagazineView.swift
//  StandardTemplate
//
//  Created by Felipe Almeida on 04/04/24.
//

import SwiftUI

struct MagazineView: View {
  var body: some View {
    VStack {
      Text("Home Screen")
      NavigationLink(destination: DetailsView()) {
        Text("Go To Details")
      }
    }
  }
}
