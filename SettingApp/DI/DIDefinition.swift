//
//  DIDefinition.swift
//  SettingApp
//
//  Created by 0v0 on 2025/02/05.
//

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
