//
//  Int+Extensions.swift
//  ReportExtension
//
//  Created by KaayZenn on 15/07/2024.
//

import Foundation

extension Int {
    
    var asHoursAndMinutes: String {
        let hours = self / 60
        let minutes = self % 60
        if hours > 0 {
            return String(format: "%dh%02d", hours, minutes)
        } else {
            return "\(minutes)min"
        }
    }
    
}
