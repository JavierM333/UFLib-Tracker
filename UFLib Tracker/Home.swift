//
//  ContentView.swift
//  UFLib Tracker
//
//  Created by Javieralejandro Martinez on 4/27/25.
//

import SwiftUI
import SwiftData

struct Home: View {
    @State private var libraries: [Library] = [
        Library(name: "Marston", openingHours: 0, closingHours: 24, maxOccupancy: 2208,currOccupancy: 0, occupancyNotif: false),
        Library(name: "Library West", openingHours: 8, closingHours: 16, maxOccupancy: 1564,currOccupancy: 1000, occupancyNotif: true),
        ]
    var body: some View {
        ZStack {
            // Full-screen background
            Color("main-bg")

            // Main content
            VStack(spacing: 0) {
                header

                ScrollView {
                    LazyVStack(spacing: 16) {
                        ForEach($libraries) { $lib in
                            LibraryCard(library: $lib)
                        }
                    }
                    .padding(.vertical)
                }

                Spacer()
            }
        }
    }
    private var header: some View {
        VStack(spacing: 0) {
            HStack {
                Image(systemName: "building.columns.fill")
                    .font(.system(size: 28))
                    .foregroundColor(Color("Orange-UF"))
                
                Text("Libraries")
                    .font(.system(size: 28, weight: .bold))
                    .foregroundColor(.black)
                
                Spacer()
            }
            .padding(.horizontal)
            .padding(.bottom, 8)
            .padding(.top, 4)
            .background(Color.white)
            .shadow(color: Color.black.opacity(0.05), radius: 2, x: 0, y: 2)
        }
        .frame(maxWidth: .infinity)
        .zIndex(1)
    }
}

#Preview {
    MainTabView()
}
