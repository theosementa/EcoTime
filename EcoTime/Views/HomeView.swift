//
//  HomeView.swift
//  EcoTime
//
//  Created by KaayZenn on 15/07/2024.
//

import SwiftUI
import DeviceActivity
import FamilyControls

struct HomeView: View {
    
    @State private var context: DeviceActivityReport.Context = .init(rawValue: "Total Activity")
    @State private var filter = DeviceActivityFilter(
        segment: .daily(during: Calendar.current.dateInterval(of: .day, for: .now)!),
        users: .all,
        devices: .init([.iPhone])
    )
    
    // MARK: -
    var body: some View {
        VStack {
            DeviceActivityReport(context, filter: filter)
        }
    } // End body
} // End struct

// MARK: - Preview
#Preview {
    HomeView()
}
