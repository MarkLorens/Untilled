//
//  ContentView.swift
//  Untilled
//
//  Created by Max on 17/04/26.
//

import SwiftUI

var plantDatas: [PlantData] = [
    PlantData(plantName: "Monstera", plantType: "Leaves", minTemperature: 20.1, maxTemperature: 25.2, minHumidity: 10.0, maxHumidity: 90.0, minPrecipitation: 0.0, maxPrecipitation: 10.0, minUV: 1, maxUV: 6),
    PlantData(plantName: "Cactus", plantType: "Cactus", minTemperature: 20.1, maxTemperature: 25.2, minHumidity: 10.0, maxHumidity: 90.0, minPrecipitation: 0.0, maxPrecipitation: 10.0, minUV: 1, maxUV: 6),
    PlantData(plantName: "Rose", plantType: "Rose", minTemperature: 20.1, maxTemperature: 25.2, minHumidity: 10.0, maxHumidity: 90.0, minPrecipitation: 0.0, maxPrecipitation: 10.0, minUV: 1, maxUV: 6),
    PlantData(plantName: "Jasmine", plantType: "Jasmine", minTemperature: 20.1, maxTemperature: 25.2, minHumidity: 10.0, maxHumidity: 90.0, minPrecipitation: 0.0, maxPrecipitation: 10.0, minUV: 1, maxUV: 6),
    PlantData(plantName: "Peach", plantType: "Fruity", minTemperature: 20.1, maxTemperature: 25.2, minHumidity: 10.0, maxHumidity: 90.0, minPrecipitation: 0.0, maxPrecipitation: 10.0, minUV: 1, maxUV: 6),
    PlantData(plantName: "Tulip", plantType: "Tulip", minTemperature: 20.1, maxTemperature: 25.2, minHumidity: 10.0, maxHumidity: 90.0, minPrecipitation: 0.0, maxPrecipitation: 10.0, minUV: 1, maxUV: 6),
    PlantData(plantName: "Sunflower", plantType: "Sunflower", minTemperature: 20.1, maxTemperature: 25.2, minHumidity: 10.0, maxHumidity: 90.0, minPrecipitation: 0.0, maxPrecipitation: 10.0, minUV: 1, maxUV: 6),
    PlantData(plantName: "Orchid", plantType: "Orchid", minTemperature: 20.1, maxTemperature: 25.2, minHumidity: 10.0, maxHumidity: 90.0, minPrecipitation: 0.0, maxPrecipitation: 10.0, minUV: 1, maxUV: 6),
    PlantData(plantName: "Grape", plantType: "Grape", minTemperature: 20.1, maxTemperature: 25.2, minHumidity: 10.0, maxHumidity: 90.0, minPrecipitation: 0.0, maxPrecipitation: 10.0, minUV: 1, maxUV: 6),
]
var weatherData = WeatherData(temperature: 30.2, humidity: 70.1, precipitation: 20.0, UV: 5)

struct MainScreen: View {
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack(alignment: .leading){
                MainLogo()
                WeatherOverviewCard(data: weatherData)
                HStack{
                    Text("My Plants")
                        .font(.title3.bold())
                    Spacer()
                    Button(action: {
                        print("Please Add SOMETHING HERE")
                    }) {
                        Image(systemName: "plus")
                            .font(.headline.weight(.semibold))
                            .padding(7)
                            .background(Circle().fill(.green))
                            .foregroundColor(.white)
                    }
                }
                .padding()
                
                LazyVGrid(columns: columns, spacing: 20){
                    ForEach(plantDatas, id: \.ID){
                        plantData in
                        PlantCard(plantData: plantData)
                    }
                }
            }
        }
    }
}

#Preview {
    MainScreen()
}
