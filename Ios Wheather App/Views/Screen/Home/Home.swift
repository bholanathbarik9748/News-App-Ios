import SwiftUI

struct Home: View {
    @ObservedObject var searchViewModel: SearchViewModel
    
    var body: some View {
        ZStack {
            // Background color
            Color.primary3
                .edgesIgnoringSafeArea(.all)
              
            // Search Bar Shared Component
            SearchBar(SearchViewModel: searchViewModel)
        }
        .onReceive(searchViewModel.objectWillChange) { _ in
            print("Search text changed to: \(searchViewModel.searchText)")
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home(searchViewModel: SearchViewModel())
    }
}
