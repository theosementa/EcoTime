//
//  DashboardView.swift
//  ReportExtension
//
//  Created by KaayZenn on 17/07/2024.
//

import SwiftUI

struct DashboardView: View {
    
    var activityReport: ActivityReport
    
    var body: some View {
        CircleChart(totalDuration: activityReport.totalDuration.asTimeString)
    }
}

//#Preview {
//    DashboardView()
//}
