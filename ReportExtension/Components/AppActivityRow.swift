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
        HStack {
            Label(app.token).labelStyle(.iconOnly)
            Text(app.displayName)
            Spacer()
            Text(app.duration.asHoursAndMinutes)
        }
    } // End body
} // End struct
