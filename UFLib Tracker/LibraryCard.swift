//
//  LibraryCard.swift
//  UFLib Tracker
//
//  Created by Javieralejandro Martinez on 5/2/25.
//
import SwiftUI

struct Library: Identifiable, Codable {
    let id = UUID()
    let name : String
    let openingHours: Int
    let closingHours: Int
    let maxOccupancy: Int
    var currOccupancy: Int
    var occupancyNotif: Bool
}

struct LibraryCard: View {
    @Binding var library: Library

    // MARK: - Helpers
    private var occupancyRatio: Double {
        guard library.maxOccupancy > 0 else { return 0 }
        return Double(library.currOccupancy) / Double(library.maxOccupancy)
    }
    private var occupancyPercent: Int {
        Int(occupancyRatio * 100)
    }

    var body: some View {
        cardContent
            .frame(maxWidth: .infinity)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.white)
            )
            .padding(.horizontal)
    }
    private var cardContent: some View {
        VStack(alignment: .leading, spacing: 12){
            HStack{
                Text(library.name)
                    .font(.headline)
                    .foregroundColor(.black)
                Spacer()
                bellButton
            }
            // Percentage labels above the bar
            HStack(alignment: .firstTextBaseline) {
                Text("\(occupancyPercent)% Occupied")
                    .font(.custom("IBMPlexSans", size: 13).weight(.bold))
                    .foregroundColor(Color.black.opacity(0.5))
                Spacer()
            }
            //Occupancy Bar
            occupancyBar
                .padding(.bottom, 8)
            
            Text( footerText )
                .font(.footnote)
                .foregroundColor( footerColor )
        }
        .padding()
    }
    private var bellButton: some View {
        Button {
            library.occupancyNotif.toggle()
        } label: {
            Image(systemName: library.occupancyNotif ? "bell.fill" : "bell")
                .font(.system(size: 20))
        }
    }
    
    private var occupancyBar: some View {
        GeometryReader { geometry in
            let clamped = max(0.0, min(1.0, occupancyRatio))
            let barWidth = geometry.size.width * CGFloat(clamped)

            ZStack(alignment: .leading) {
                // Background track
                Capsule()
                    .fill(Color("main-bg"))
                    .frame(height: 20)

                // Filled portion
                Capsule()
                    .fill(
                        LinearGradient(
                            colors: [Color("UFDarkBlue"), Color("UFDarkBlueGrey")],
                            startPoint: .leading,
                            endPoint: .trailing)
                    )
                    .frame(width: barWidth, height: 20)
            }
        }
        .frame(height: 20)
    }
    private var footerText: String {
        let currentHour = Calendar.current.component(.hour, from: Date())

        // If currently open
        if currentHour >= library.openingHours && currentHour < library.closingHours {
            return "Closes at \(formatHour(library.closingHours))"
        } else {
            // Before opening or after closing
            return "Opens at \(formatHour(library.openingHours))"
        }
    }

    private var footerColor: Color {
        let currentHour = Calendar.current.component(.hour, from: Date())

        // Green when open, red when closed
        return (currentHour >= library.openingHours && currentHour < library.closingHours)
            ? .green
            : .red
    }
    // MARK: - Time Formatting
    private func formatHour(_ hour: Int) -> String {
        var hour12 = hour % 12
        if hour12 == 0 { hour12 = 12 }
        let suffix = hour < 12 ? "am" : "pm"
        return "\(hour12)\(suffix)"
    }
}
