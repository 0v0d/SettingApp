//
//  Item.swift
//  SettingApp
//
//  Created by 0v0 on 2025/01/30.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
