import SwiftUI

struct Home: View {
    @ObservedObject var searchViewModel: SearchViewModel
    @State private var weatherModel: WeatherModel?
    @StateObject private var weatherServicesViewModel = WeatherServices()
    
    var body: some View {
        ZStack {
            // Background color
            Color.primary3
                .edgesIgnoringSafeArea(.all)
            
            // Search Bar Shared Component
            VStack {
                SearchBar(SearchViewModel: searchViewModel)
                    .padding(20)
                
                if let weather = weatherModel {
                    if let date = searchViewModel.extractDate(from: weather.current.lastUpdated),
                       let time = searchViewModel.extractTimeAmPm(from: weather.current.lastUpdated) {
                        CurrentWeatherView(
                            tempC: weather.current.tempC,
                            tempF: weather.current.tempF,
                            condition: weather.current.condition.text,
                            date: date,
                            time: time
                        )
                    } else {
                        Text("Date or time format error")
                            .foregroundColor(.gray)
                    }
                } else {
                    Text("No weather data available")
                        .foregroundColor(.gray)
                }
            }
        }
        .onReceive(searchViewModel.objectWillChange) { _ in
            print("Search text changed to: \(searchViewModel.searchText)")
            Task {
                do {
                    if !searchViewModel.searchText.isEmpty {
                        let fetchedWeatherModel = try await weatherServicesViewModel.getWeather(location: searchViewModel.searchText)
                        DispatchQueue.main.async {
                            weatherModel = fetchedWeatherModel
                            print("Data: \(weatherModel)")
                        }
                    } else {
                        // Reset weatherModel when search text is empty
                        DispatchQueue.main.async {
                            weatherModel = nil
                        }
                    }
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
