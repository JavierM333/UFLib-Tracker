//
//  Item.swift
//  UFLib Tracker
//
//  Created by Javieralejandro Martinez on 4/27/25.
//

import Foundation

/// Shape of one item coming back from the API
struct LiveOccupancy: Codable {
    let name: String          // must match "Marston", "Library West", …
    let current: Int          // current head‑count
}

enum LibraryService {
    static let endpoint = URL(string: "https://YOUR‑API/occupancy.json")!   // replace

    /// Fetch latest counts, returns `[name : current]`
    static func fetchOccupancy() async throws -> [String:Int] {
        let (data, _) = try await URLSession.shared.data(from: endpoint)
        let decoded = try JSONDecoder().decode([LiveOccupancy].self, from: data)
        return Dictionary(uniqueKeysWithValues: decoded.map { ($0.name, $0.current) })
    }
}
