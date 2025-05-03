//
//  MainTabView.swift
//  UFLib Tracker
//
//  Created by Javieralejandro Martinez on 5/1/25.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
          Home()
            .tabItem {
              Image(systemName: "house")
              Text("Home")
            }
          Settings()
            .tabItem {
              Image(systemName: "gearshape")
              Text("Settings")
            }
        }
        .toolbarBackground(.white)
        .toolbarBackgroundVisibility(.visible)
    }
}
