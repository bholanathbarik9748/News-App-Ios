import SwiftUI

struct CurrentWeatherView: View {
    @State private var tempC: Double
    @State private var tempF: Double
    @State private var condition: String
    @State private var date: String
    @State private var time: String
    
    init(tempC: Double, tempF: Double, condition: String, date: String, time: String) {
        _tempC = State(initialValue: tempC)
        _tempF = State(initialValue: tempF)
        _condition = State(initialValue: condition)
        _date = State(initialValue: date)
        _time = State(initialValue: time)
    }
        
    private var weatherData: [[String]] {
        return [
            ["Celsius", "\(tempC)°C", "thermometer"],
            ["Fahrenheit", "\(tempF)°F", "thermometer"],
            ["Condition", condition, "cloud.rain"],
            ["Date", date, "calendar"],
            ["Time", time, "clock"],
        ]
    }
    
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
        CurrentWeatherView(tempC: 25.0, tempF: 77.0, condition: "Rainy", date: "2024-07-13", time: "14:00")
    }
}
