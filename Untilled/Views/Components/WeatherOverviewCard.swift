//
//  WeatherOverviewCard.swift
//  Untilled
//
//  Created by Ryan Tjendana on 17/04/26.
//
import SwiftUI

struct WeatherOverviewCard: View {
    let data: WeatherData
    var body: some View {
        HStack (alignment:.top) {
            VStack(alignment: .leading){
                Text("Kabupaten Badung")
                    .font(.callout)
                    .foregroundStyle(Color(.black.opacity(0.5)))
                Text("\(data.temperature, specifier: "%.f")°").font(.system(size: 100, weight: .light))
                Text("Watch out for UV Light").bold()
            }
            .padding()
            Spacer()
            VStack(alignment: .leading){
                HStack{
                    Image(systemName: "humidity.fill")
                    Text("\(data.humidity, specifier: "%.f")%")
                }
                .opacity(0.7)
                HStack{
                    Image(systemName: "sun.max.fill")
                    Text("\(data.UV)")
                }
                .opacity(0.7)
                HStack{
                    Image(systemName: "cloud.rain.fill")
                    Text("\(data.precipitation, specifier: "%.f") mm")
                }
                .opacity(0.7)
            }
            .padding()
        }
        .background(Color(.green).opacity(0.18))
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.black, lineWidth: 2)
        )
        .cornerRadius(10)
        .padding(.horizontal)
    }
}

#Preview {
    var weatherData = WeatherData(temperature: 30.2, humidity: 70.1, precipitation: 20.0, UV: 5)
    WeatherOverviewCard(data: weatherData)
}
