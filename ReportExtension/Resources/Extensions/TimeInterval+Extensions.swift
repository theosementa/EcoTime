//
//  TimeInterval+Extensions.swift
//  ReportExtension
//
//  Created by KaayZenn on 15/07/2024.
//

import Foundation

extension TimeInterval {
    func toMin() -> Int {
        return Int(self / 60)
    }
}
