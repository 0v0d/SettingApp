//
//  ContentView.swift
//  SettingApp
//
//  Created by 0v0 on 2025/01/30.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var viewModel: SettingsViewModel
    @State private var showingSetting = false
    
    init(viewModel: SettingsViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationStack {
            CounterView()
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            showingSetting.toggle()
                        } label: {
                            Image(systemName: "gear")
                        }
                    }
                }
        }
        .sheet(isPresented: $showingSetting) {
            SettingView(viewModel: viewModel)
        }
        .preferredColorScheme(
            viewModel.themeMode == .system ? nil : (
                viewModel.themeMode == .dark ? .dark : .light
            )
        )
        .environment(\.locale, viewModel.languageConfig.locale)
    }
}

#Preview {
    ContentView( viewModel: SettingsViewModel(repository: UserDefaultsSettingsRepository(
        userDefaults: .standard))
    )
}
