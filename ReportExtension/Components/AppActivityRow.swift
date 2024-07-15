//
//  AppActivityRow.swift
//  ReportExtension
//
//  Created by KaayZenn on 15/07/2024.
//

import SwiftUI

struct AppActivityRow: View {
    
    // Builder
    var app: AppDeviceActivity
    
    // MARK: -
    var body: some View {
        HStack {
            Text(app.displayName)
            Spacer()
            Text(app.duration.asHoursAndMinutes)
        }
    } // End body
} // End struct

// MARK: - Preview
#Preview {
    AppActivityRow(
        app: .init(
            id: "preview123",
            displayName: "Preview App",
            duration: 124,
            numberOfPickups: 5
        )
    )
}
