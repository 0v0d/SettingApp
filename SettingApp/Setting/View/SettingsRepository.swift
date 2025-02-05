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


struct SettingView: View {
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var viewModel: SettingsViewModel
    
    var body: some View {
        NavigationStack {
            Form {
                SettingsSectionView(
                    title: "Theme",
                    items: viewModel.themeModes,
                    itemTitle: { $0.title },
                    onSelect: { mode in
                        viewModel.updateThemeMode(mode)
                    },
                    firstIndex: viewModel.themeModes.firstIndex(of: viewModel.themeMode) ?? 0
                )
                
                SettingsSectionView(
                    title: "Language",
                    items: viewModel.languageConfigs,
                    itemTitle: { $0.title },
                    onSelect: { config in
                        viewModel.updateLanguageConfig(config)
                    },
                    firstIndex: viewModel.languageConfigs.firstIndex(of: viewModel.languageConfig) ?? 0
                )
            }
            .navigationTitle("Setting")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done") {
                        dismiss()
                    }
                    .foregroundColor(.blue)
                }
            }
            .preferredColorScheme(
                viewModel.themeMode == .system ? nil : (viewModel.themeMode == .dark ? .dark : .light)
                
            )
        }
    }
}

struct SettingsSectionView
<T: RawRepresentable & CaseIterable & Equatable>: View {
    let title: String
    let items: [T]
    let itemTitle: (T) -> String
    let onSelect: (T) -> Void
    let firstIndex: Int
    @State private var selectedIndex: Int = 0
    
    var body: some View {
        Section(header: Text(title)) {
            ForEach(items.indices, id: \.self) { index in
                HStack {
                    Image(systemName: selectedIndex == index ?
                          "checkmark.circle.fill" : "circle")
                    .foregroundColor(.blue)
                    
                    Text(itemTitle(items[index]))
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    selectedIndex = index
                    onSelect(items[index])
                }
            }
        }.onAppear {
            selectedIndex = firstIndex
        }
    }
}