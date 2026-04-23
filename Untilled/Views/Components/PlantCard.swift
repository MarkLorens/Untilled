//
//  PlantCards.swift
//  Untilled
//
//  Created by Ryan Tjendana on 17/04/26.
//

import SwiftUI

struct PlantCard: View {
    let plantData: PlantData
    let weatherData: WeatherData
    var plantStatus: [statuses] {
        FetchPlantStatus(
            weatherData: weatherData,
            plantData: plantData
        )
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(plantData.plantName).foregroundColor(.black)
            
            Image(plantData.plantType)
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .padding(.leading)
                .padding(.top)
            
            HStack {
                if(plantStatus.count < 1){
                    Circle()
                        .fill(.green)
                        .frame(width: 10, height: 10)
                }
                else if(plantStatus.count < 3){
                    Circle()
                        .fill(.orange)
                        .frame(width: 10, height: 10)
                }
                else{
                    Circle()
                        .fill(.red)
                        .frame(width: 10, height: 10)
                }
                    
                Text(plantStatus[0].rawValue)
                    .font(.subheadline)
                    .lineLimit(1)
            }
            .padding(.top)
        }
        .padding(5)
        .background(Color.white)
        //.cornerRadius(10)
        //.shadow(radius: 2)
    }
}

#Preview {
    let data = PlantData(plantName: "Monstera", plantType: "Leaves", minTemperature: 20.1, maxTemperature: 25.2, minHumidity: 10.0, maxHumidity: 90.0, minPrecipitation: 0.0, maxPrecipitation: 10.0, minUV: 1, maxUV: 6)
    let weatherData = WeatherData(temperature: 28, humidity: 70.1, precipitation: 20.0, uv: 5)
    
    PlantCard(plantData: data, weatherData: weatherData)
}
