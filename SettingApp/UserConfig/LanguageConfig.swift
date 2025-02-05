//
//  LanguageConfig.swift
//  SettingApp
//
//  Created by 0v0 on 2025/02/05.
//


enum LanguageConfig: String, CaseIterable {
    case en, ja
    
    var title: String {
        switch self {
        case .en: return "English"
        case .ja: return "Japanese"
        }
    }
}
