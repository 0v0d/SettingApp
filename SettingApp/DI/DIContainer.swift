//
//  DIContainer.swift
//  SettingApp
//
//  Created by 0v0 on 2025/02/05.
//

import Foundation

final class DIContainer {
    public static let shared: DIContainer = .init()
    private var dependencies: [ObjectIdentifier: Any] = [:]
    
    public static func createTestContainer() -> DIContainer {
        return DIContainer()
    }
    
    private init() {}
    
    public func register<T>(type: T.Type, factory: @escaping () -> T) {
        let key = ObjectIdentifier(type)
        if dependencies[key] == nil {
            dependencies[key] = factory
        } else {
            fatalError(DIError.alreadyRegistered(type).localizedDescription)
        }
    }
     
    public func resolve<T>(_ type: T.Type) -> T {
        let key = ObjectIdentifier(type)
        guard let factory = dependencies[key] as? () -> T else {
            fatalError(DIError.notRegistered(type).localizedDescription)
        }
        return factory()
    }
}
