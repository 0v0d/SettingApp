//
//  SettingView.swift
//  SettingApp
//
//  Created by 0v0 on 2025/02/05.
//

import SwiftUI

struct SettingView: View {
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var viewModel: SettingsViewModel
    
    var body: some View {
        NavigationStack {
            Form {
                SettingsSectionView(
                    title: "Theme",
                    items: viewModel.themeModes,
                    itemTitle: { $0.title },
                    onSelect: { mode in
                        viewModel.updateThemeMode(mode)
                    },
                    firstIndex: viewModel.themeModes.firstIndex(of: viewModel.themeMode) ?? 0
                )
                
                SettingsSectionView(
                    title: "Language",
                    items: viewModel.languageConfigs,
                    itemTitle: { $0.title },
                    onSelect: { config in
                        viewModel.updateLanguageConfig(config)
                    },
                    firstIndex: viewModel.languageConfigs.firstIndex(of: viewModel.languageConfig) ?? 0
                )
            }
            .navigationTitle("Setting")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done") {
                        dismiss()
                    }
                    .foregroundColor(.blue)
                }
            }
            .preferredColorScheme(
                viewModel.themeMode == .system ? nil : (viewModel.themeMode == .dark ? .dark : .light)
                
            )
        }
    }
}
