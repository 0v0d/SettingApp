//
//  ThemeMode.swift
//  SettingApp
//
//  Created by 0v0 on 2025/02/05.
//

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

