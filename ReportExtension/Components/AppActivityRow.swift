//
//  AppActivityRow.swift
//  ReportExtension
//
//  Created by KaayZenn on 15/07/2024.
//

import SwiftUI
import FamilyControls

struct AppActivityRow: View {
    
    // Builder
    var app: AppDeviceActivity
    
    // MARK: -
    var body: some View {
        HStack(spacing: 16) {
            Label(app.token)
                .labelStyle(.iconOnly)
                .scaleEffect(2)
            VStack(spacing: 8) {
                VStack(alignment: .leading, spacing: 0) {
                    HStack {
                        Text(app.displayName)
                        Spacer()
                        Text(app.percentage.formatWith(num: app.percentage > 1 ? 0 : 2) + "%")
                    }
                    .font(.system(size: 16, weight: .semibold, design: .rounded))
                    
                    Text(app.duration.asTimeString)
                        .foregroundStyle(Color.gray)
                        .font(.system(size: 12, weight: .semibold, design: .rounded))
                }
                
                Capsule()
                    .fill(Color.clear)
                    .frame(height: 3)
                    .background {
                        GeometryReader { proxy in
                            Capsule()
                                .fill(Color.blue)
                                .frame(width: proxy.size.width * (app.percentage / 100))
                        }
                    }
            }
        }
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(Color.Apple.backgroundComponent)
        }
    } // End body
} // End struct
