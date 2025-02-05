enum LanguageConfig: String, CaseIterable {
    case en, ja
    
    var title: String {
        switch self {
        case .en: return "English"
        case .ja: return "Japanese"
        }
    }
}
