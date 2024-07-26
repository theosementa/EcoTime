//
//  DashboardView.swift
//  ReportExtension
//
//  Created by KaayZenn on 17/07/2024.
//

import SwiftUI

struct DashboardView: View {
    
    // Builder
    var activityReport: ActivityReport
    
    // MARK: -
    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                CircleChart(totalDuration: activityReport.totalDuration.convertToTime())
                
                if let appMostUsed = activityReport.appMostUsed {
                    VStack(spacing: 12) {
                        Text("App most used")
                            .font(.barlowSemiBold(size: 24))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        AppActivityRow(app: appMostUsed)
                    }
                }
                
                if let categoryMostUsed = activityReport.categoryMostUsed {
                    VStack(spacing: 12) {
                        Text("Category most used")
                            .font(.barlowSemiBold(size: 24))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        CategoryRow(category: categoryMostUsed)
                    }
                }
                
                VStack(spacing: 12) {
                    Text("Statistics")
                        .font(.barlowSemiBold(size: 24))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    HStack(spacing: 16) {
                        StatisticsRow(
                            value: "\(activityReport.percentageSinceMidnight)%",
                            text: "since today at 00h00"
                        )
                        StatisticsRow(
                            value: "\(activityReport.percentageFor24hrs)%",
                            text: "on a day of 24h"
                        )
                    }
                }
            } // End VStack
            .padding()
            .padding(.top)
        } // End ScrollView
        .scrollIndicators(.hidden)
    } // End body
} // End struct
