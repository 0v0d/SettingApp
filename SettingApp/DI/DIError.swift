//
//  DIError.swift
//  SettingApp
//
//  Created by 0v0 on 2025/02/05.
//

import Foundation

enum DIError: LocalizedError {
    case alreadyRegistered(_ type: Any.Type)
    case notRegistered(_ type: Any.Type)
    
    var errorDescription: String? {
        switch self {
        case .alreadyRegistered(let type):
            return String(
                format: NSLocalizedString(
                    "already_registered",
                    comment: "Error when trying to register an already registered dependency"
                ),
                String(describing: type)
            )
        case .notRegistered(let type):
            return String(
                format: NSLocalizedString(
                    "not_registered",
                    comment: "Error when trying to resolve an unregistered dependency"
                ),
                String(describing: type)
            )
        }
    }
}
