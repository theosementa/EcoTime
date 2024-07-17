//
//  DeviceActivityReportContext.swift
//  ReportExtension
//
//  Created by KaayZenn on 17/07/2024.
//

import DeviceActivity
import SwiftUI

extension DeviceActivityReport.Context {
    // If your app initializes a DeviceActivityReport with this context, then the system will use
    // your extension's corresponding DeviceActivityReportScene to render the contents of the
    // report.
    static let totalActivity = Self("Total Activity")
    static let dashboard = Self("Dashboard")
}
