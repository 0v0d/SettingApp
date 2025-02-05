struct SettingsSectionView
<T: RawRepresentable & CaseIterable & Equatable>: View {
    let title: String
    let items: [T]
    let itemTitle: (T) -> String
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