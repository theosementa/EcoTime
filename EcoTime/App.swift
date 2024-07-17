//
//  EcoTimeApp.swift
//  EcoTime
//
//  Created by KaayZenn on 15/07/2024.
//

import SwiftUI
import FamilyControls

@main
struct EcoTimeApp: App {
    
    let center = AuthorizationCenter.shared
    
    @StateObject private var deviceActivityManager: DeviceActivityManager = .shared
    
    // MARK: -
    var body: some Scene {
        WindowGroup {
            TabView {
                HomeView()
                    .tabItem {
                        Label("Home", systemImage: "house.fill")
                    }
                StatisticsView()
                    .tabItem {
                        Label("Statistics", systemImage: "chart.bar.fill")
                    }
            } // End TabView
            .environmentObject(deviceActivityManager)
            .task {
                do {
                    try await center.requestAuthorization(for: .individual)
                } catch {
                    print("Error: \(error)")
                }
            }
        }
    } // End body
}
