//
//  DeviceActivityManager.swift
//  EcoTime
//
//  Created by KaayZenn on 17/07/2024.
//

import Foundation
import SwiftUI
import DeviceActivity
import FamilyControls

final class DeviceActivityManager: ObservableObject {
    static let shared = DeviceActivityManager()
    
    @Published var filter = DeviceActivityFilter(
        segment: .daily(during: Calendar.current.dateInterval(of: .day, for: .now)!),
        users: .all,
        devices: .init([.iPhone])
    )
    
}
