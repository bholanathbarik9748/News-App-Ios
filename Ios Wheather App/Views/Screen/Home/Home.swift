import SwiftUI

struct Home: View {
    @ObservedObject var searchViewModel: SearchViewModel
    @StateObject private var weatherServicesViewModel = WeatherServices();
    
    var body: some View {
        ZStack {
            // Background colordd
            Color.primary3
                .edgesIgnoringSafeArea(.all)
              
            // Search Bar Shared Component
            SearchBar(SearchViewModel: searchViewModel)
        }
        .onReceive(searchViewModel.objectWillChange) { _ in
            print("Search text changed to: \(searchViewModel.searchText)")
            
            Task {
                            do {
                                try await weatherServicesViewModel.getWeather(location: searchViewModel.searchText)
                            } catch {
                                print("Failed to fetch weather: \(error)")
                            }
                        }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home(searchViewModel: SearchViewModel())
    }
}
