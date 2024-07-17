//
//  StatisticsView.swift
//  EcoTime
//
//  Created by KaayZenn on 17/07/2024.
//

import SwiftUI
import DeviceActivity

struct StatisticsView: View {
    
    // EnvironmentObject
    @EnvironmentObject private var deviceActivityManager: DeviceActivityManager
    
    // MARK: -
    var body: some View {
        NavigationStack {
            DeviceActivityReport(.totalActivity, filter: deviceActivityManager.filter)
                .navigationTitle("Statistics")
        }
    } // End body
} // End struct

// MARK: - Preview
#Preview {
    StatisticsView()
}
