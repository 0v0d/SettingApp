//
//  SettingsSectionView.swift
//  SettingApp
//
//  Created by 0v0 on 2025/02/05.
//

import SwiftUI

struct SettingsSectionView
<T: RawRepresentable & CaseIterable & Equatable>: View {
    let title: LocalizedStringKey
    let items: [T]
    let itemTitle: (T) -> LocalizedStringKey
    let onSelect: (T) -> Void
    let firstIndex: Int
    @State private var selectedIndex: Int = 0
    
    var body: some View {
        Section(header: Text(title)) {
            ForEach(items.indices, id: \.self) { index in
                HStack {
                    Image(systemName: selectedIndex == index ?
                          "checkmark.circle.fill" : "circle")
                    .foregroundColor(.blue)
                    
                    Text(itemTitle(items[index]))
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    selectedIndex = index
                    onSelect(items[index])
                }
            }
        }.onAppear {
            selectedIndex = firstIndex
        }
    }
}
