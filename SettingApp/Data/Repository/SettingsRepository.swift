//
//  SettingsRepository.swift
//  SettingApp
//
//  Created by 0v0 on 2025/02/05.
//

import SwiftUI

protocol SettingsRepository {
    func getThemeMode() -> ThemeMode
    func setThemeMode(_ mode: ThemeMode)
    func getLanguageConfig() -> LanguageConfig
    func setLanguageConfig(_ config: LanguageConfig)
}

private enum UserDefaultsKeys {
    static let themeMode = "themeMode"
    static let languageConfig = "languageConfig"
}

final class UserDefaultsSettingsRepository: SettingsRepository {
    private let userDefaults: UserDefaults

    init(userDefaults: UserDefaults = .standard) {
        self.userDefaults = userDefaults
    }

    func getThemeMode() -> ThemeMode {
        guard let rawValue = userDefaults.string(forKey: UserDefaultsKeys.themeMode),
              let mode = ThemeMode(rawValue: rawValue) else {
            return .system
        }
        return mode
    }

    func setThemeMode(_ mode: ThemeMode) {
        userDefaults.set(mode.rawValue, forKey: UserDefaultsKeys.themeMode)
    }

    func getLanguageConfig() -> LanguageConfig {
        guard let rawValue = userDefaults.string(forKey: UserDefaultsKeys.languageConfig),
              let config = LanguageConfig(rawValue: rawValue) else {
            return .english
        }
        return config
    }

    func setLanguageConfig(_ config: LanguageConfig) {
        userDefaults.set(config.rawValue, forKey: UserDefaultsKeys.languageConfig)
    }
}

