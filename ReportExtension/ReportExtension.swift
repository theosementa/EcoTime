//
//  ReportExtension.swift
//  ReportExtension
//
//  Created by KaayZenn on 15/07/2024.
//

import DeviceActivity
import SwiftUI

@main
struct ReportExtension: DeviceActivityReportExtension {
    var body: some DeviceActivityReportScene {
        // Create a report for each DeviceActivityReport.Context that your app supports.
        TotalActivityReport { totalActivity in
            return TotalActivityView(activityReport: totalActivity)
        }
        DashboardReport { totalActivity in
            return DashboardView(activityReport: totalActivity)
        }
        // Add more reports here...
    }
}
