//
//  CategoryRow.swift
//  ReportExtension
//
//  Created by KaayZenn on 23/07/2024.
//

import SwiftUI

struct CategoryRow: View {
    
    // Builder
    var category: CategoryWithApps
    
    // MARK: -
    var body: some View {
        HStack(spacing: 16) {
            if let token = category.token {
                Label(token)
                    .labelStyle(.iconOnly)
                    .scaleEffect(1.4)
            }
            VStack(spacing: 8) {
                VStack(alignment: .leading, spacing: 0) {
                    HStack {
                        Text(category.name)
                        Spacer()
                        Text(category.percentage.formatWith(num: category.percentage > 1 ? 0 : 2) + "%")
                    }
                    .font(.barlowSemiBold(size: 18))
                    
                    Text(category.totalDuration.asTimeString)
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
                                .frame(width: proxy.size.width * (category.percentage / 100))
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
