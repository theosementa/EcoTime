//
//  StatisticsRow.swift
//  ReportExtension
//
//  Created by KaayZenn on 17/07/2024.
//

import SwiftUI

struct StatisticsRow: View {
    
    // Builder
    var value: String
    var text: String
    
    // MARK: -
    var body: some View {
        VStack {
            Text(value)
                .font(.barlowExtraBold(size: 32))
            Text(text)
                .font(.barlowRegular(size: 16))
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
        .padding(.vertical, 12)
        .background {
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(Color.Apple.backgroundComponent)
        }
    } // End body
} // End struct

// MARK: - Preview
#Preview {
    StatisticsRow(value: "14%", text: "on a day of 24h")
}
