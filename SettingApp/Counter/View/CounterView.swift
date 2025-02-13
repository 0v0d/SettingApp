//
//  CounterView.swift
//  SettingApp
//
//  Created by 0v0 on 2025/02/05.
//

import SwiftUI

struct CounterView: View {
    @StateObject private var viewModel: CounterViewModel
    
    init() {
        #if DEBUG
            _viewModel = StateObject(wrappedValue: CounterViewModel())
        #else
            _viewModel = StateObject(
                wrappedValue:DIContainer.shared.resolve(
                    CounterViewModel.self)
            )
        #endif
    }

    var body: some View {
        VStack(spacing: 30) {
            Text(viewModel.count.description)
                .font(.system(size: 70, weight: .bold))
            
            HStack(spacing: 30) {
                CircularButtonView(
                    systemImageName: "minus",
                    backgroundColor: .red,
                    action: { viewModel.decrement() }
                )
                
                CircularButtonView(
                    systemImageName: "plus",
                    backgroundColor: .green,
                    action: { viewModel.increment() }
                )
            }
            
            ResetButton(reset: viewModel.reset)
        }
    }
}

extension CounterView{
    
    private struct CircularButtonView: View {
        let systemImageName: String
        let backgroundColor: Color
        let action: () -> Void
        
        var body: some View {
            Button(action: action) {
                Image(systemName: systemImageName)
                    .font(.system(size: 30, weight: .bold))
                    .foregroundColor(.white)
                    .frame(width: 100, height: 100)
                    .background(backgroundColor)
                    .clipShape(Circle())
                    .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 5)
            }
            .buttonStyle(PlainButtonStyle())
        }
    }
    
    private struct ResetButton: View {
        let reset: () -> Void
        
        var body : some View {
            Button(action: reset) {
                Text("reset")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(width: 200, height: 60)
                    .background(
                        LinearGradient(
                            gradient: Gradient(colors: [Color.gray.opacity(0.6), Color.gray.opacity(0.8)]),
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .cornerRadius(30)
                    .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 5)
            }
            .padding(.top, 20)
        }
    }
}

#Preview {
    CounterView()
}
