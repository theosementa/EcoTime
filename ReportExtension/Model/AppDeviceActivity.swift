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

struct AppDeviceActivity: Identifiable, Hashable {
    var id: String
    var displayName: String
    var duration: Int
    var percentage: Double
    var numberOfPickups: Int
    var token: ApplicationToken
    var category: DeviceActivityData.CategoryActivity
}

struct CategoryWithApps: Identifiable {
    let id: UUID = UUID()
    let category: DeviceActivityData.CategoryActivity
    let apps: [AppDeviceActivity]
    let percentage: Double
    
    var totalDuration: Int {
        apps.reduce(0) { $0 + $1.duration }
    }
}

extension ActivityReport {
    var appsByCategories: [CategoryWithApps] {
        let grouped = Dictionary(grouping: apps) { $0.category }
        
        let categoriesWithApps = grouped.map { category, apps in
            let sortedApps = apps.sorted { $0.duration > $1.duration }
            let categoryDuration = sortedApps.reduce(0) { $0 + $1.duration }
            let percentage = (Double(categoryDuration) / Double(totalDuration)) * 100
            
            return CategoryWithApps(
                category: category,
                apps: sortedApps,
                percentage: percentage
            )
        }
        
        return categoriesWithApps.sorted { $0.totalDuration > $1.totalDuration }
    }
    
    var appMostUsed: AppDeviceActivity? {
        return apps.sorted { $0.duration > $1.duration }.first
    }
    
    var percentageFor24hrs: Int {
        return Int((Double(totalDuration) / 86400.0) * 100.0)
    }
    
    var percentageSinceMidnight: Int {
        let startOfDay = Calendar.current.startOfDay(for: .now)
        let timeInterval = Date().timeIntervalSince(startOfDay)
        return Int((Double(totalDuration) / timeInterval) * 100.0)
    }
}

//import ManagedSettings
//if let encoded = try? JSONEncoder().encode(app.token) {
//                Text(String(data: encoded, encoding: .utf8) ?? "")
//                if let decoded = try? JSONDecoder().decode(ApplicationToken.self, from: encoded) {
//                    Label(decoded).labelStyle(.iconOnly)
//                }
//            }
