final class SettingsViewModel: ObservableObject {
    private let repository: SettingsRepository
    
    @Published  private(set) var themeMode: ThemeMode
    @Published  private(set) var languageConfig: LanguageConfig
    
    init(repository: SettingsRepository) {
        self.repository = repository
        self.themeMode = repository.getThemeMode()
        self.languageConfig = repository.getLanguageConfig()
    }
    
    let themeModes: [ThemeMode] = [.system, .light, .dark]
    let languageConfigs: [LanguageConfig] = [.en, .ja]
    
    func updateThemeMode(_ mode: ThemeMode) {
        themeMode = mode
        repository.setThemeMode(mode)
    }
    
    func updateLanguageConfig(_ config: LanguageConfig) {
        languageConfig = config
        repository.setLanguageConfig(config)
    }
}