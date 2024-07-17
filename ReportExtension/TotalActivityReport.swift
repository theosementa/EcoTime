//
//  TotalActivityReport.swift
//  ReportExtension
//
//  Created by KaayZenn on 15/07/2024.
//

import DeviceActivity
import SwiftUI

struct TotalActivityReport: DeviceActivityReportScene {
    
    // Define which context your scene will represent.
    let context: DeviceActivityReport.Context = .totalActivity
    
    // Define the custom configuration and the resulting view for this report.
    let content: (ActivityReport) -> TotalActivityView
    
    func makeConfiguration(representing data: DeviceActivityResults<DeviceActivityData>) async -> ActivityReport {
        // Reformat the data into a configuration that can be used to create
        // the report's view.
        var list: [AppDeviceActivity] = []
        let totalActivityDuration = await data.flatMap { $0.activitySegments }.reduce(0, {
            $0 + $1.totalActivityDuration
        })
        
        for await item in data {
            for await activity in item.activitySegments {
                for await category in activity.categories {
                    for await application in category.applications {
                        let appName = (application.application.localizedDisplayName ?? "nil")
                        guard !list.contains(where: { $0.displayName == appName }) else { continue }
                        
                        let duration = application.totalActivityDuration
                        let bundle = (application.application.bundleIdentifier ?? "nil")
                        let numberOfPickups = application.numberOfPickups
                        
                        guard let token = application.application.token else { continue }
                        
                        let app = AppDeviceActivity(
                            id: bundle,
                            displayName: appName,
                            duration: Int(duration),
                            percentage: (duration / totalActivityDuration) * 100,
                            numberOfPickups: numberOfPickups,
                            token: token,
                            category: category
                        )
                        list.append(app)
                    }
                }
            }
        }
        
        return ActivityReport(totalDuration: Int(totalActivityDuration), apps: list)
    }
}

struct DashboardReport: DeviceActivityReportScene {
    
    // Define which context your scene will represent.
    let context: DeviceActivityReport.Context = .dashboard
    
    // Define the custom configuration and the resulting view for this report.
    let content: (ActivityReport) -> DashboardView
    
    func makeConfiguration(representing data: DeviceActivityResults<DeviceActivityData>) async -> ActivityReport {
        // Reformat the data into a configuration that can be used to create
        // the report's view.
        var list: [AppDeviceActivity] = []
        let totalActivityDuration = await data.flatMap { $0.activitySegments }.reduce(0, {
            $0 + $1.totalActivityDuration
        })
        
        for await item in data {
            for await activity in item.activitySegments {
                for await category in activity.categories {
                    for await application in category.applications {
                        let appName = (application.application.localizedDisplayName ?? "nil")
                        guard !list.contains(where: { $0.displayName == appName }) else { continue }
                        
                        let duration = application.totalActivityDuration
                        let bundle = (application.application.bundleIdentifier ?? "nil")
                        let numberOfPickups = application.numberOfPickups
                        
                        guard let token = application.application.token else { continue }
                        
                        let app = AppDeviceActivity(
                            id: bundle,
                            displayName: appName,
                            duration: Int(duration),
                            percentage: (duration / totalActivityDuration) * 100,
                            numberOfPickups: numberOfPickups,
                            token: token,
                            category: category
                        )
                        list.append(app)
                    }
                }
            }
        }
        
        return ActivityReport(totalDuration: Int(totalActivityDuration), apps: list)
    }
}
