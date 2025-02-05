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
    @AppStorage(UserDefaultsKeys.themeMode) private var themeMode: String = ThemeMode.system.rawValue
    @AppStorage(UserDefaultsKeys.languageConfig) private var languageConfig = LanguageConfig.en.rawValue
    
    func getThemeMode() -> ThemeMode {
        return ThemeMode(rawValue: themeMode) ?? .system
    }
    
    func setThemeMode(_ mode: ThemeMode) {
        themeMode = mode.rawValue
    }
    
    func getLanguageConfig() -> LanguageConfig {
        return LanguageConfig(rawValue: languageConfig) ?? .en
    }
    
    func setLanguageConfig(_ config: LanguageConfig) {
        languageConfig = config.rawValue
    }
}
