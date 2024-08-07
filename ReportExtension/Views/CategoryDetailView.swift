//
//  CategoryDetailView.swift
//  ReportExtension
//
//  Created by KaayZenn on 23/07/2024.
//

import SwiftUI

struct CategoryDetailView: View {
    
    // Builder
    var category: CategoryWithApps
    
    // MARK: -
    var body: some View {
        List {
            Text("Total time : " + category.totalDuration.convertToTime(isShort: false))
                .font(.barlowBold(size: 22))
                .frame(maxWidth: .infinity, alignment: .trailing)
                .listRowSeparator(.hidden)
            
            ForEach(category.apps) { app in
                AppActivityRow(app: app, forCategory: true)
                    .listRowBackground(Color.clear)
                    .listRowSeparator(.hidden)
                    .listRowInsets(.init(top: 6, leading: 16, bottom: 6, trailing: 16))
            }
        }
        .listStyle(.plain)
        .scrollIndicators(.hidden)
        .navigationTitle(category.name)
    } // End body
} // End struct
