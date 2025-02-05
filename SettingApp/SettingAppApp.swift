//
//  SettingAppApp.swift
//  SettingApp
//
//  Created by 0v0 on 2025/01/30.
//

import SwiftUI

@main
struct SettingAppApp: App {
    
    init() {
        DIDefinition().inject()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView(
                viewModel: DIContainer.shared.resolve(SettingsViewModel.self)
            )
        }
    }
}

#Preview {
    ContentView(
        viewModel: DIContainer.shared.resolve(SettingsViewModel.self)
    )
}
