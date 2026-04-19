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
struct MainScreen: View {
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    @State private var weather: WeatherData?
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false){
            VStack(alignment: .leading){
                MainLogo()
                
                if let weather {
                    WeatherOverviewCard(data: weather)
                } else {
                    ProgressView()
                        .padding()
                }
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
        .task {
            await loadWeather()
        }
    }
}

extension MainScreen {
    func loadWeather() async {
        do {
            let result = try await fetchWeather()
            self.weather = result
        } catch {
            print("Failed to fetch weather:", error)
        }
    }
}

#Preview {
    MainScreen()
}
