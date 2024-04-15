//
//  StandardTemplateApp.swift
//  StandardTemplate
//
//  Created by Felipe Almeida on 02/04/24.
//

import SwiftUI
import PSPDFKit
import PSPDFKitUI

@main
struct HomeApp: App {
  @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
  
  var body: some Scene {
    WindowGroup {
      HomeContentView()
    }
  }
}

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    PSPDFKit.SDK.setLicenseKey("gfQV4V1-Lou9B1yPXoyDQi2TL_9forcWGIpA4J-ZVB3YRzA4O87QzJi-jpY3Y8s1ZmU3IjUcT-ygynvhNmhOA-0tDxJszh0IgXQ8IbAn_HTSLBfG5nzrpEjwKPUSntj_FNsobnzGlwi8ejUsKEEylqu5dt8AZDrrOvsFLxvjpi6QIKNoNjM7GFnqdfy9hUCxWSFP9txC73XQlng")
    return true
  }
}

extension View {
  func navigationBarColor(_ backgroundColor: UIColor) -> some View {
    self.modifier(NavigationBarColorModifier(backgroundColor: backgroundColor))
  }
}

struct NavigationBarColorModifier: ViewModifier {
  var backgroundColor: UIColor?
  
  init(backgroundColor: UIColor?) {
    self.backgroundColor = backgroundColor
    
    let coloredAppearance = UINavigationBarAppearance()
    coloredAppearance.configureWithOpaqueBackground()
    coloredAppearance.backgroundColor = backgroundColor
    
    UINavigationBar.appearance().standardAppearance = coloredAppearance
    UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
  }
  
  func body(content: Content) -> some View {
    content
  }
}
