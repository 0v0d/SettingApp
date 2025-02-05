//
//  LanguageConfig.swift
//  SettingApp
//
//  Created by 0v0 on 2025/02/05.
//

import SwiftUICore

enum LanguageConfig: String, CaseIterable {
    case english, japanese
    
    var locale: Locale {
        switch self {
        case .english: Locale(identifier: "en")
        case .japanese: Locale(identifier: "ja")
        }
    }
    
    var title: LocalizedStringKey {
        switch self {
        case .english: return "english"
        case .japanese: return "japanese"
        }
    }
}
