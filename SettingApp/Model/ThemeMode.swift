//
//  ThemeMode.swift
//  SettingApp
//
//  Created by 0v0 on 2025/02/05.
//

import SwiftUI

enum ThemeMode: String, CaseIterable {
    case system, light, dark

    var title: LocalizedStringKey {
        switch self {
        case .system: return "system"
        case .light: return "light"
        case .dark: return "dark"
        }
    }
}
