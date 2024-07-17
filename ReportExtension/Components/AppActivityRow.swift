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
                .scaleEffect(2.1)
            VStack(spacing: 8) {
                VStack(alignment: .leading, spacing: 0) {
                    HStack {
                        Text(app.displayName)
                        Spacer()
                        Text(app.percentage.formatWith(num: app.percentage > 1 ? 0 : 2) + "%")
                    }
                    .font(.barlowSemiBold(size: 18))
                    
                    Text(app.duration.asTimeString)
                        .foregroundStyle(Color.gray)
                        .font(.barlowSemiBold(size: 14))
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
        .padding(.vertical, 14)
        .padding(.horizontal, 20)
        .background {
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(Color.Apple.backgroundComponent)
        }
    } // End body
} // End struct
