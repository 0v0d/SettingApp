//
//  SettingView.swift
//  SettingApp
//
//  Created by 0v0 on 2025/02/05.
//

import SwiftUI

struct SettingView: View {
    @ObservedObject var viewModel: SettingsViewModel
    @State private var isChecked = true
    @Environment(\.dismiss) private var dismiss
    @Environment(\.openURL) private var openURL
    
    var body: some View {
        NavigationStack {
            Form {
                SettingsSectionView(
                    title: "theme",
                    items: viewModel.themeModes,
                    itemTitle: { $0.title },
                    onSelect: { mode in
                        viewModel.updateThemeMode(mode)
                    },
                    firstIndex: viewModel.themeModes.firstIndex(of: viewModel.themeMode) ?? 0
                )
                
                if isChecked {
                    SettingsSectionView(
                        title: "language",
                        items: viewModel.languageConfigs,
                        itemTitle: { $0.title },
                        onSelect: { config in
                            viewModel.updateLanguageConfig(config)
                        },
                        firstIndex: viewModel.languageConfigs.firstIndex(of: viewModel.languageConfig) ?? 0
                    )
                } else {
                    Section("language") {
                        Button("open_settings") {
                            if let url = URL(string: UIApplication.openSettingsURLString) {
                                openURL(url)
                            }
                        }
                    }
                }
                
                Toggle(isOn: $isChecked) {
                    Text("app_settings")
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("settings")
                        .font(.headline)
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("done") {
                        dismiss()
                    }
                    .foregroundColor(.blue)
                }
            }
            .preferredColorScheme(
                viewModel.themeMode == .system ? nil : (
                    viewModel.themeMode == .dark ? .dark : .light
                    )
            )
            .animation(.easeInOut, value: viewModel.themeMode)
        }
    }
}

#Preview {
    SettingView(
        viewModel: SettingsViewModel(repository: UserDefaultsSettingsRepository(
            userDefaults: .standard
        ))
    )
}
