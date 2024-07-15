//
//  TotalActivityReport.swift
//  ReportExtension
//
//  Created by KaayZenn on 15/07/2024.
//

import DeviceActivity
import SwiftUI

extension DeviceActivityReport.Context {
    // If your app initializes a DeviceActivityReport with this context, then the system will use
    // your extension's corresponding DeviceActivityReportScene to render the contents of the
    // report.
    static let totalActivity = Self("Total Activity")
}

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
                        
                        let duration = application.totalActivityDuration
                        guard duration.toMin() > 0 else { continue }
                        
                        let appName = (application.application.localizedDisplayName ?? "nil")
                        let bundle = (application.application.bundleIdentifier ?? "nil")
                        let numberOfPickups = application.numberOfPickups
                        
                        let app = AppDeviceActivity(
                            id: bundle,
                            displayName: appName,
                            duration: duration.toMin(),
                            numberOfPickups: numberOfPickups
                        )
                        list.append(app)
                    }
                }
            }
        }
        
        return ActivityReport(totalDuration: totalActivityDuration.toMin(), apps: list)
    }
}
