//
//  HomeView.swift
//  EcoTime
//
//  Created by KaayZenn on 15/07/2024.
//

import SwiftUI
import DeviceActivity

struct HomeView: View {
        
    // EnvironmentObject
    @EnvironmentObject private var deviceActivityManager: DeviceActivityManager
    
    // MARK: -
    var body: some View {
        NavigationStack {
            DeviceActivityReport(.dashboard, filter: deviceActivityManager.filter)
                .navigationTitle("Home")
        }
    } // End body
} // End struct

// MARK: - Preview
#Preview {
    HomeView()
}
