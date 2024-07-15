//
//  TotalActivityView.swift
//  ReportExtension
//
//  Created by KaayZenn on 15/07/2024.
//

import SwiftUI

struct ActivityReport {
    let totalDuration: Int
    let apps: [AppDeviceActivity]
}

struct AppDeviceActivity: Identifiable {
    var id: String
    var displayName: String
    var duration: Int
    var numberOfPickups: Int
}
