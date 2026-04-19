//
//  FlowerDetail.swift
//  Untilled
//
//  Created by Max on 19/04/26.
//

import SwiftUI

struct PlantDetail: View {
    let plant: PlantData
    var body: some View{
        VStack(alignment: .leading, spacing: 16) {
            Text(plant.plantName)
                .font(.largeTitle.bold())
            
            Text("Type: \(plant.plantType)")
                .foregroundStyle(.secondary)
            
            Divider()
            
            Text("Ideal Conditions")
                .font(.title2.bold())
            
            Text("Temperature: \(plant.minTemperature, specifier: "%.1f")°C - \(plant.maxTemperature, specifier: "%.1f")°C")
            
            Text("Humidity: \(plant.minHumidity, specifier: "%.0f")% - \(plant.maxHumidity, specifier: "%.0f")%")
            
            Text("Precipitation: \(plant.minPrecipitation, specifier: "%.1f") - \(plant.maxPrecipitation, specifier: "%.1f") mm")
            
            Text("UV Index: \(plant.minUV) - \(plant.maxUV)")
            
            Spacer()
        }
        .padding()
        .navigationTitle(plant.plantName)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    PlantDetail(
        plant: PlantData(
            plantName: "Monstera",
            plantType: "Leaves",
            minTemperature: 20,
            maxTemperature: 25,
            minHumidity: 40,
            maxHumidity: 80,
            minPrecipitation: 0,
            maxPrecipitation: 5,
            minUV: 1,
            maxUV: 6
        )
    )
}
