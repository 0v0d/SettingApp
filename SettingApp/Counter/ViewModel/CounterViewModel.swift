//
//  CounterViewModel.swift
//  SettingApp
//
//  Created by 0v0 on 2025/02/05.
//

import Foundation

@MainActor
final class CounterViewModel: ObservableObject {
    @Published private(set) var count = 0
    
    func increment() {
        count += 1
    }
    
    func decrement() {
        count -= 1
    }
    
    func reset() {
        count = 0
    }
}
