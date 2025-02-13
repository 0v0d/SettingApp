//
//  DIDefinition.swift
//  SettingApp
//
//  Created by 0v0 on 2025/02/05.
//

final class DIDefinition {
    private let diContainer: DIContainer
    
    init(diContainer: DIContainer) {
        self.diContainer = diContainer
    }
    
    @MainActor
    func inject() async {
        // UserDefaultsSettingsRepositoryの登録
        diContainer.register(type: UserDefaultsSettingsRepository.self) {
            UserDefaultsSettingsRepository()
        }
        
        // SettingsViewModelの登録
        diContainer.register(type: SettingsViewModel.self) { [diContainer] in
            SettingsViewModel(
                repository: diContainer.resolve(UserDefaultsSettingsRepository.self)
            )
        }
        
        // CounterViewModelの登録
        diContainer.register(type: CounterViewModel.self) {
            CounterViewModel()
        }
    }
}
