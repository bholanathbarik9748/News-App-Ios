import SwiftUI

struct CurrentWeatherView: View {
    @State private var weatherData = [
        ["Celsius", "31°C", "thermometer"],
        ["Fahrenheit", "81.1°F", "thermometer"],
        ["Condition", "Moderate or heavy rain with thunder", "cloud.rain"],
        ["Date", "26/9/2024", "calendar"],
        ["Time", "10:23 PM", "clock"],
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
                VStack(spacing: 20) {
                    ForEach(weatherData, id: \.self) { data in
                        TabViewForCurrentWeather(
                            FirstTitle: Binding.constant(data[0]),
                            FirstValue: Binding.constant(data[1]),
                            FistIcon: Binding.constant(data[2])
                        )
                    }
                }
                
        }
    }
}

struct CurrentWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentWeatherView()
    }
}
