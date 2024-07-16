//
//  TotalActivityView.swift
//  ReportExtension
//
//  Created by KaayZenn on 15/07/2024.
//

import SwiftUI
import ManagedSettings
import DeviceActivity

struct ActivityReport {
    let totalDuration: Int
    let apps: [AppDeviceActivity]
}

struct AppDeviceActivity: Identifiable {
    var id: String
    var displayName: String
    var duration: Int
    var percentage: Double
    var numberOfPickups: Int
    var token: ApplicationToken
    var category: DeviceActivityData.CategoryActivity
}

//import ManagedSettings
//if let encoded = try? JSONEncoder().encode(app.token) {
//                Text(String(data: encoded, encoding: .utf8) ?? "")
//                if let decoded = try? JSONDecoder().decode(ApplicationToken.self, from: encoded) {
//                    Label(decoded).labelStyle(.iconOnly)
//                }
//            }
