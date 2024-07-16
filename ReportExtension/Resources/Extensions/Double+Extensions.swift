//
//  Double+Extensions.swift
//  ReportExtension
//
//  Created by KaayZenn on 16/07/2024.
//

import Foundation

extension Double {
    
    public func formatWith(num: Int) -> String {
        return String(format: "%.\(num)f", self)
    }
    
}
