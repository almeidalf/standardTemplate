//
//  ContentView.swift
//  StandardTemplate
//
//  Created by Felipe Almeida on 02/04/24.
//

import SwiftUI

struct HomeView: View {
  var body: some View {
    VStack {
      Text("Home Screen")
      NavigationLink(destination: DetailsView()) {
        Text("Go To Details")
      }
    }
  }
}

struct ProfileView: View {
  var body: some View {
    Text("Profile Screen")
  }
}

struct ContentView: View {
  @State private var selectedTab = 0
  
  var body: some View {
    TabView(selection: $selectedTab) {
      NavigationView {
        HomeView()
      }
      .tabItem {
        Image(systemName: "house")
        Text("Home")
      }
      .tag(0)
      
      NavigationView {
        ProfileView()
      }
      .tabItem {
        Image(systemName: "person")
        Text("Profile")
      }
      .tag(1)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}

