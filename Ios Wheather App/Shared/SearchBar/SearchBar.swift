import SwiftUI

struct SearchBar: View {
    @ObservedObject var SearchViewModel: SearchViewModel;
    
    var body: some View {
        VStack {
            ZStack(alignment: .trailing) {
                TextField("Search City 🌤️", text: $SearchViewModel.searchText)
                    .padding()
                    .frame(height: 50)
                    .background(Color(.systemGray6))
                    .cornerRadius(15)
                
                if !SearchViewModel.searchText.isEmpty {
                    Button(action: {
                        SearchViewModel.clearSearchBarText()
                    }) {
                        Image(systemName: "xmark.circle")
                            .foregroundColor(.gray)
                            .padding(.trailing, 8)
                    }
                    .padding(.trailing, 8)
                }
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    SearchBar(SearchViewModel: SearchViewModel())
}
