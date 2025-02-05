final class DIDefinition {
    
    func inject() {
        let dependecies = DIContainer.shared
        
        dependecies.register(
            UserDefaultsSettingsRepository.self,
            impl: UserDefaultsSettingsRepository()
        )
        dependecies.register(
            SettingsViewModel.self,
            impl: SettingsViewModel(
                repository: dependecies.resolve(UserDefaultsSettingsRepository.self)
            )
        )
    }
}
