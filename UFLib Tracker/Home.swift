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
        // Main STEM hub – 24 h Sunday–Thursday
        Library(name: "Marston", openingHours: 0, closingHours: 24,
                maxOccupancy: 2_208, currOccupancy: 1_350, occupancyNotif: false),

        // Humanities & Social Sciences
        Library(name: "Library West", openingHours: 8, closingHours: 18,
                maxOccupancy: 1_200, currOccupancy: 700, occupancyNotif: true),

        // Special Collections & Archive (a.k.a. Library East / Smathers)
        Library(name: "Smathers Library", openingHours: 9, closingHours: 17,
                maxOccupancy: 700, currOccupancy: 650, occupancyNotif: false),

        // Architecture & Fine Arts
        Library(name: "AFA Library", openingHours: 8, closingHours: 22,
                maxOccupancy: 250, currOccupancy: 75, occupancyNotif: false),

        // Education
        Library(name: "Education Library", openingHours: 8, closingHours: 20,
                maxOccupancy: 650, currOccupancy: 200, occupancyNotif: false),

        // Health Science Center
        Library(name: "Health Science Center Library", openingHours: 7, closingHours: 24,
                maxOccupancy: 872, currOccupancy: 500, occupancyNotif: true),

        // Law (Legal Information Center)
        Library(name: "Legal Information Center", openingHours: 7, closingHours: 22,
                maxOccupancy: 450, currOccupancy: 150, occupancyNotif: false)
    ]
    @AppStorage("sortByOccupancy") private var sortByOccupancy: Bool = false
    var body: some View {
        ZStack {
            // Full-screen background
            Color("main-bg")

            // Main content
            VStack(spacing: 0) {
                header

                ScrollView {
                    LazyVStack(spacing: 16) {
                        if sortByOccupancy {
                            ForEach($libraries.sorted { a, b in
                                let ratioA = Double(a.wrappedValue.currOccupancy) / Double(a.wrappedValue.maxOccupancy)
                                let ratioB = Double(b.wrappedValue.currOccupancy) / Double(b.wrappedValue.maxOccupancy)
                                return ratioA < ratioB
                            }) { $lib in
                                LibraryCard(library: $lib)
                            }
                        } else {
                            ForEach($libraries) { $lib in
                                LibraryCard(library: $lib)
                            }
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
            HStack(alignment: .bottom) {
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
            .padding(.top, 8)
            .background(Color.white)
            .shadow(color: Color.black.opacity(0.01), radius: 2, x: 0, y: 2)
        }
        .frame(maxWidth: .infinity)
        .zIndex(1)
    }
}

#Preview {
    MainTabView()
}
