//
//  UFLib_TrackerApp.swift
//  UFLib Tracker
//
//  Created by Javieralejandro Martinez on 4/27/25.
//

import SwiftUI
import SwiftData

@main
struct UFLib_TrackerApp: App {
    var body: some Scene {
        WindowGroup {
            MainTabView()
                .preferredColorScheme(.light)
        }
    }
}
