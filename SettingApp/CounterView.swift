struct CounterView: View {
    @StateObject private var viewModel = CounterViewModel()
    
    var body: some View {
        
        VStack(spacing: 30) {
            Text("\(viewModel.count)")
                .font(.system(size: 70, weight: .bold))
            
            HStack(spacing: 30) {
                // Decrement Button
                CircularButtonView(
                    systemImageName: "minus",
                    backgroundColor: .red,
                    action: { viewModel.decrement() }
                )
                
                // Increment Button
                CircularButtonView(
                    systemImageName: "plus",
                    backgroundColor: .green,
                    action: { viewModel.increment() }
                )
            }
            
            // Reset Button with gradient and shadow
            Button(action: {
                viewModel.reset()
            }) {
                Text("Reset")
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

struct CircularButtonView: View {
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

#Preview {
    CounterView()
}