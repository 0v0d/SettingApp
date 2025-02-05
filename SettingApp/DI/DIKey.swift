//
//  DIKey.swift
//  SettingApp
//
//  Created by 0v0 on 2025/02/05.
//

final class DIKey: Hashable {
    private let type: Any.Type
    
    init(_ type: Any.Type) {
        self.type = type
    }
    
    //Hashableに準拠するために必要
    func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(type))
    }
    
    //Hashableに準拠するために必要
    static func == (lhs: DIKey, rhs: DIKey) -> Bool {
        lhs.type == rhs.type
    }
}
