import Foundation

class WeatherServices: ObservableObject {
    let baseUrl = "https://api.weatherapi.com/v1/forecast.json"
    let apiKey = ProcessInfo.processInfo.environment["API_KEY"]
    
    @Published var weatherData: WeatherModel? // Update to use WeatherModel
    
    func getWeather(location: String) async throws -> WeatherModel {
        guard let apiKey = apiKey else {
            throw WeatherServiceError.missingAPIKey
        }
        
        let urlString = "\(baseUrl)?key=\(apiKey)&q=\(location)&days=1"
        guard let url = URL(string: urlString) else {
            throw WeatherServiceError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        do {
            let decodedData = try JSONDecoder().decode(WeatherModel.self, from: data)
            return decodedData;
        } catch {
            throw WeatherServiceError.decodingError(error)
        }
    }
}

enum WeatherServiceError: Error {
    case missingAPIKey
    case invalidURL
    case decodingError(Error)
}
