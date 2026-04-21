//
//  PlantData.swift
//  Untilled
//
//  Created by Max on 19/04/26.
//

import Foundation

var plantDatas: [PlantData] = [
    PlantData(plantName: "Monstera", plantType: "Leaves", minTemperature: randomDouble(18...25),
              maxTemperature: randomDouble(25...35),
              minHumidity: randomDouble(20...60),
              maxHumidity: randomDouble(60...100),
              minPrecipitation: randomDouble(0...5),
              maxPrecipitation: randomDouble(5...20),
              minUV: randomInt(1...3),
              maxUV: randomInt(4...8)),
    PlantData(plantName: "Cactus", plantType: "Cactus", minTemperature: randomDouble(18...25),
              maxTemperature: randomDouble(25...35),
              minHumidity: randomDouble(20...60),
              maxHumidity: randomDouble(60...100),
              minPrecipitation: randomDouble(0...5),
              maxPrecipitation: randomDouble(5...20),
              minUV: randomInt(1...3),
              maxUV: randomInt(4...8)),
    PlantData(plantName: "Rose", plantType: "Rose", minTemperature: randomDouble(18...25),
              maxTemperature: randomDouble(25...35),
              minHumidity: randomDouble(20...60),
              maxHumidity: randomDouble(60...100),
              minPrecipitation: randomDouble(0...5),
              maxPrecipitation: randomDouble(5...20),
              minUV: randomInt(1...3),
              maxUV: randomInt(4...8)),
    PlantData(plantName: "Jasmine", plantType: "Jasmine", minTemperature: randomDouble(18...25),
              maxTemperature: randomDouble(25...35),
              minHumidity: randomDouble(20...60),
              maxHumidity: randomDouble(60...100),
              minPrecipitation: randomDouble(0...5),
              maxPrecipitation: randomDouble(5...20),
              minUV: randomInt(1...3),
              maxUV: randomInt(4...8)),
    PlantData(plantName: "Peach", plantType: "Fruity", minTemperature: randomDouble(18...25),
              maxTemperature: randomDouble(25...35),
              minHumidity: randomDouble(20...60),
              maxHumidity: randomDouble(60...100),
              minPrecipitation: randomDouble(0...5),
              maxPrecipitation: randomDouble(5...20),
              minUV: randomInt(1...3),
              maxUV: randomInt(4...8)),
    PlantData(plantName: "Tulip", plantType: "Tulip", minTemperature: randomDouble(18...25),
              maxTemperature: randomDouble(25...35),
              minHumidity: randomDouble(20...60),
              maxHumidity: randomDouble(60...100),
              minPrecipitation: randomDouble(0...5),
              maxPrecipitation: randomDouble(5...20),
              minUV: randomInt(1...3),
              maxUV: randomInt(4...8)),
    PlantData(plantName: "Sunflower", plantType: "Sunflower", minTemperature: randomDouble(18...25),
              maxTemperature: randomDouble(25...35),
              minHumidity: randomDouble(20...60),
              maxHumidity: randomDouble(60...100),
              minPrecipitation: randomDouble(0...5),
              maxPrecipitation: randomDouble(5...20),
              minUV: randomInt(1...3),
              maxUV: randomInt(4...8)),
    PlantData(plantName: "Orchid", plantType: "Orchid", minTemperature: randomDouble(18...25),
              maxTemperature: randomDouble(25...35),
              minHumidity: randomDouble(20...60),
              maxHumidity: randomDouble(60...100),
              minPrecipitation: randomDouble(0...5),
              maxPrecipitation: randomDouble(5...20),
              minUV: randomInt(1...3),
              maxUV: randomInt(4...8)),
    PlantData(plantName: "Grape", plantType: "Grape", minTemperature: randomDouble(18...25),
              maxTemperature: randomDouble(25...35),
              minHumidity: randomDouble(20...60),
              maxHumidity: randomDouble(60...100),
              minPrecipitation: randomDouble(0...5),
              maxPrecipitation: randomDouble(5...20),
              minUV: randomInt(1...3),
              maxUV: randomInt(4...8)),
]

func randomDouble(_ range: ClosedRange<Double>) -> Double {
    return Double.random(in: range)
}

func randomInt(_ range: ClosedRange<Int>) -> Int {
    return Int.random(in: range)
}

func addPlant(plant: PlantData) {
    plantDatas.append(plant)
}

func deletePlant(id: UUID){
    if let index = plantDatas.firstIndex(where: { $0.id == id }) {
        plantDatas.remove(at: index)
    }
}
