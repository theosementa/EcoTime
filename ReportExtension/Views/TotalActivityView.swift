//
//  TotalActivityView.swift
//  ReportExtension
//
//  Created by KaayZenn on 15/07/2024.
//

import SwiftUI

struct TotalActivityView: View {
    
    // Builder
    var activityReport: ActivityReport
    
    // ViewModel
    @StateObject private var viewModel: TotalActivityViewModel = .init()
    
    // MARK: -
    var body: some View {
        NavigationStack {
            List {
                HStack {
                    Spacer()
                    Picker("", selection: $viewModel.statSelected) {
                        Text("Apps").tag(Stats.apps)
                        Text("Categories").tag(Stats.categories)
                    }
                    .labelsHidden()
                }
                .listRowSeparator(.hidden)
                
                if viewModel.statSelected == .apps {
                    ForEach(activityReport.apps.sorted { $0.duration > $1.duration }) { app in
                        AppActivityRow(app: app)
                            .listRowBackground(Color.clear)
                            .listRowSeparator(.hidden)
                            .listRowInsets(.init(top: 6, leading: 16, bottom: 6, trailing: 16))
                    }
                } else {
                    ForEach(activityReport.appsByCategories) { categoryWithApps in
                        ZStack {
                            NavigationLink(destination: CategoryDetailView(category: categoryWithApps)) {
                                EmptyView()
                            }
                            CategoryRow(category: categoryWithApps)
                        }
                        .listRowBackground(Color.clear)
                        .listRowSeparator(.hidden)
                        .listRowInsets(.init(top: 6, leading: 16, bottom: 6, trailing: 16))
                    }
                }
            }
            .navigationTitle("Statistics")
        }
        .listStyle(.plain)
        .scrollIndicators(.hidden)
    } // End body
} // End struct

//// In order to support previews for your extension's custom views, make sure its source files are
//// members of your app's Xcode target as well as members of your extension's target. You can use
//// Xcode's File Inspector to modify a file's Target Membership.
//#Preview {
//    TotalActivityView(totalActivity: "1h 23m")
//}
