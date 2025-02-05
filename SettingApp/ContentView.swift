//
//  ContentView.swift
//  SettingApp
//
//  Created by 0v0 on 2025/01/30.
//

import SwiftUI

struct ContentView: View {
    @State private var showingSetting = false
    @ObservedObject var viewModel: SettingsViewModel
    
    var body: some View {
        NavigationStack {
            CounterView()
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            showingSetting.toggle()
                        } label: {
                            Image(systemName: "gear")
                        }
                    }
                }
        }
        .sheet(isPresented: $showingSetting) {
            SettingView(viewModel: viewModel)
        }
        .preferredColorScheme(
            viewModel.themeMode == .system ? nil : (viewModel.themeMode == .dark ? .dark : .light)
            
        )
        
    }
}



#Preview {
    ContentView(
        viewModel:DIContainer.shared.resolve(SettingsViewModel.self)
    )
}
