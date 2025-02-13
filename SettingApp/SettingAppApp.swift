//
//  SettingAppApp.swift
//  SettingApp
//
//  Created by 0v0 on 2025/01/30.
//

import SwiftUI

@main
struct SettingAppApp: App {
    private let diContainer: DIContainer
    @State private var isInitialized = false
    
    init() {
        diContainer = DIContainer.shared
    }
    
    var body: some Scene {
        WindowGroup {
            if isInitialized {
                ContentView(
                    viewModel: diContainer.resolve(SettingsViewModel.self)
                )
            } else {
                ProgressView()
                    .task {
                        let diDefinition = DIDefinition(diContainer: diContainer)
                        await diDefinition.inject()
                        isInitialized = true
                    }
            }
        }
    }
}

#Preview {
    ContentView( viewModel: SettingsViewModel(repository: UserDefaultsSettingsRepository(
        userDefaults: .standard))
    )
}
