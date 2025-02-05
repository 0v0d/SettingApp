enum ThemeMode: String, CaseIterable {
    case system, light, dark
    
    var title: String {
        switch self {
        case .system: return "System"
        case .light: return "Light"
        case .dark: return "Dark"
        }
    }
}

enum LanguageConfig: String, CaseIterable {
    case en, ja
    
    var title: String {
        switch self {
        case .en: return "English"
        case .ja: return "Japanese"
        }
    }
}