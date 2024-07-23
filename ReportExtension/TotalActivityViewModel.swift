//
//  TotalActivityViewModel.swift
//  ReportExtension
//
//  Created by KaayZenn on 23/07/2024.
//

import Foundation

enum Stats: String {
    case apps, categories
}

final class TotalActivityViewModel: ObservableObject {    
    @Published var statSelected: Stats = .apps
}
