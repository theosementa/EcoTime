//
//  CircleChart.swift
//  ReportExtension
//
//  Created by KaayZenn on 17/07/2024.
//

import SwiftUI

struct CircleChart: View {
    
    // Builder
    var totalDuration: String
    
    // MARK: -
    var body: some View {
        Circle()
            .stroke(Color.Apple.backgroundComponent, lineWidth: 30)
            .frame(width: 200, height: 200)
            .overlay {
                Circle()
                    .trim(from: 0.5, to: 1)
                    .stroke(Color.mainPurple, style: StrokeStyle(lineWidth: 30, lineCap: .round, lineJoin: .round))
                    .rotationEffect(.degrees(90))
                
                Text(totalDuration)
                    .font(.barlowBold(size: 48))
            }
    } // End body
} // End struct

// MARK: - Preview
#Preview {
    CircleChart(totalDuration: "9h41")
}
