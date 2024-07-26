//
//  Int+Extensions.swift
//  ReportExtension
//
//  Created by KaayZenn on 15/07/2024.
//

import Foundation

extension Int {
    
    func convertToTime(isShort: Bool = true) -> String {
        let hours = self / 3600
        let minutes = (self % 3600) / 60
        let seconds = self % 60
        
        if hours > 0 {
            if isShort {
                return String(format: "%dh%02d", hours, minutes)
            } else {
                return String(format: "%dh %02dmin", hours, minutes)
            }
        } else if minutes > 0 {
            return "\(minutes)min"
        } else {
            return "\(seconds)s"
        }
    }
    
}
