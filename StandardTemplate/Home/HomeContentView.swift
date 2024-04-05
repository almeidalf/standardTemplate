//
//  ContentView.swift
//  StandardTemplate
//
//  Created by Felipe Almeida on 02/04/24.
//

import SwiftUI

struct HomeContentView: View {
  @ObservedObject var viewModel = HomeViewModel()
  @State private var selectedTab = 0
  
  var body: some View {
    if !viewModel.hiddenTabView {
      TabView(selection: $selectedTab) {
        NavigationView {
          HomeView()
        }
        .tabItem {
          Image(systemName: "house")
          Text("Sua Banca")
        }
        .tag(0)
        
        NavigationView {
          MagazineView()
        }
        .tabItem {
          Image(systemName: "newspaper")
          Text("Navegar")
        }
        .tag(1)
        
        NavigationView {
          MagazineView()
        }
        .tabItem {
          Image(systemName: "arrow.down.circle.dotted")
          Text("Minhas edições")
        }
        .tag(2)
        
        NavigationView {
          MagazineView()
        }
        .tabItem {
          Image(systemName: "person")
          Text("Perfil")
        }
        .tag(3)
      }
      .background(.white)
    }
  }
}

struct HomeContentView_Previews: PreviewProvider {
  static var previews: some View {
    HomeContentView()
  }
}

