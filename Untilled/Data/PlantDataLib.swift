//
//  PlantData.swift
//  Untilled
//
//  Created by Max on 19/04/26.
//

import Foundation

var plantDatas: [PlantData] = [
        PlantData(
            plantName: "Monstera",
            plantType: "Leaves",
            minTemperature: 18,
            maxTemperature: 30,
            minHumidity: 60,
            maxHumidity: 90,
            minPrecipitation: 5,
            maxPrecipitation: 15,
            minUV: 2,
            maxUV: 5
        ),
        PlantData(
            plantName: "Cactus",
            plantType: "Cactus",
            minTemperature: 20,
            maxTemperature: 35,
            minHumidity: 10,
            maxHumidity: 100,
            minPrecipitation: 0,
            maxPrecipitation: 3,
            minUV: 2,
            maxUV: 10
        ),
        PlantData(
            plantName: "Rose",
            plantType: "Rose",
            minTemperature: 15,
            maxTemperature: 28,
            minHumidity: 40,
            maxHumidity: 70,
            minPrecipitation: 5,
            maxPrecipitation: 12,
            minUV: 5,
            maxUV: 8
        ),
        PlantData(
            plantName: "Jasmine",
            plantType: "Jasmine",
            minTemperature: 18,
            maxTemperature: 30,
            minHumidity: 50,
            maxHumidity: 80,
            minPrecipitation: 5,
            maxPrecipitation: 12,
            minUV: 4,
            maxUV: 7
        ),
        PlantData(
            plantName: "Peach",
            plantType: "Fruity",
            minTemperature: 15,
            maxTemperature: 30,
            minHumidity: 40,
            maxHumidity: 70,
            minPrecipitation: 8,
            maxPrecipitation: 15,
            minUV: 6,
            maxUV: 9
        ),
        PlantData(
            plantName: "Tulip",
            plantType: "Tulip",
            minTemperature: 10,
            maxTemperature: 20,
            minHumidity: 40,
            maxHumidity: 60,
            minPrecipitation: 5,
            maxPrecipitation: 10,
            minUV: 4,
            maxUV: 7
        ),
        PlantData(
            plantName: "Sunflower",
            plantType: "Sunflower",
            minTemperature: 18,
            maxTemperature: 32,
            minHumidity: 30,
            maxHumidity: 60,
            minPrecipitation: 5,
            maxPrecipitation: 10,
            minUV: 7,
            maxUV: 10
        ),
        PlantData(
            plantName: "Orchid",
            plantType: "Orchid",
            minTemperature: 18,
            maxTemperature: 28,
            minHumidity: 60,
            maxHumidity: 90,
            minPrecipitation: 8,
            maxPrecipitation: 15,
            minUV: 2,
            maxUV: 5
        ),
        PlantData(
            plantName: "Grape",
            plantType: "Grape",
            minTemperature: 15,
            maxTemperature: 30,
            minHumidity: 40,
            maxHumidity: 70,
            minPrecipitation: 5,
            maxPrecipitation: 12,
            minUV: 6,
            maxUV: 9
        )
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
