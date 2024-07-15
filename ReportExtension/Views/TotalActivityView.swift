//
//  TotalActivityView.swift
//  ReportExtension
//
//  Created by KaayZenn on 15/07/2024.
//

import SwiftUI

struct TotalActivityView: View {
    
    // Builder
    var activityReport: ActivityReport
    
    // MARK: -
    var body: some View {
        VStack {
            Text("Total Screen Time : \(activityReport.totalDuration.asHoursAndMinutes)")
            List(activityReport.apps.sorted { $0.duration > $1.duration }) { app in
                AppActivityRow(app: app)
            }
        }
    } // End body
} // End struct

//// In order to support previews for your extension's custom views, make sure its source files are
//// members of your app's Xcode target as well as members of your extension's target. You can use
//// Xcode's File Inspector to modify a file's Target Membership.
//#Preview {
//    TotalActivityView(totalActivity: "1h 23m")
//}