//
//  Settings.swift
//  UFLib Tracker
//
//  Created by Javieralejandro Martinez on 5/1/25.
//

import SwiftUI

struct Settings: View {
    @AppStorage("sortByOccupancy") private var sortByOccupancy: Bool = false
    @State private var notifThreshold: Double = 80

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("List Ordering")) {
                    Toggle("Sort by occupancy", isOn: $sortByOccupancy)
                }
                Section(header: Text("Notification Threshold")) {
                    VStack(alignment: .leading) {
                        Text("Notify when occupancy falls below \(Int(notifThreshold))%")
                        Slider(value: $notifThreshold, in: 0...100, step: 1)
                    }
                    .padding(.vertical, 4)
                }
            }
            .navigationTitle("Settings")
            .background(Color("main-bg").ignoresSafeArea())
        }
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
