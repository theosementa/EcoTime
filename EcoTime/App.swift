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
    
    var body: some Scene {
        WindowGroup {
            TabView {
                HomeView()
                StatisticsView()
            } // End TabView
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
