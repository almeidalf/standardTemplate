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
        DetailsView()
      }
      .tabItem {
        Image(systemName: "newspaper")
        Text("Navegar")
      }
      .tag(1)
      
      NavigationView {
        EmptyView()
      }
      .tabItem {
        Image(systemName: "arrow.down.circle.dotted")
        Text("Minhas edições")
      }
      .tag(2)
      
      NavigationView {
        EmptyView()
      }
      .tabItem {
        Image(systemName: "person")
        Text("Perfil")
      }
      .tag(3)
    }
    .toolbarBackground(.white, for: .automatic)
    .ignoresSafeArea()
  }
}

struct HomeContentView_Previews: PreviewProvider {
  static var previews: some View {
    HomeContentView()
  }
}

extension View {
  var bottomSafeArea: CGFloat {
    UIWindow.key?.safeAreaInsets.bottom ?? 0
  }
}

public extension UIWindow {
  static var key: UIWindow? {
    (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first { $0.isKeyWindow }
  }
}

