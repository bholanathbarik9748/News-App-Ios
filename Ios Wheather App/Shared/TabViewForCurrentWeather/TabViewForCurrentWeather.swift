import SwiftUI

struct TabViewForCurrentWeather: View {
    @Binding var FirstTitle: String
    @Binding var FirstValue: String
    @Binding var FistIcon: String
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    HStack(spacing: 8) {
                        Image(systemName: FistIcon)
                            .font(.system(size: 20))
                            .foregroundColor(.blue) // Example color, customize as needed
                        Text(FirstTitle)
                            .font(.headline)
                            .fontWeight(.bold)
                    }
                    Text(FirstValue)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .padding()
                
                Spacer()
            }
        }
        .frame(width: 310)
        .background(Color(.systemGray6))
        .cornerRadius(15)
        .padding(.horizontal)
    }
}

struct TabViewForCurrentWeather_Previews: PreviewProvider {
    static var previews: some View {
        TabViewForCurrentWeather(
            FirstTitle: .constant("Temperature"),
            FirstValue: .constant("31°C"),
            FistIcon: .constant("thermometer")
        )
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
