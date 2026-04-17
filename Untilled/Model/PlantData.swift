//
//  FlowerData.swift
//  Untilled
//
//  Created by Max on 17/04/26.
//

import SwiftData
import Foundation

@Model
class PlantData{
    @Attribute(.unique) var ID: UUID
    var plantName: String
    var plantType: String
    var minTemperature: Double
    var maxTemperature: Double
    var minHumidity: Double
    var maxHumidity: Double
    var minPrecipitation: Double
    var maxPrecipitation: Double
    var minUV: Int
    var maxUV: Int
    
    init(plantName: String, plantType: String, minTemperature: Double, maxTemperature: Double, minHumidity: Double, maxHumidity: Double, minPrecipitation: Double, maxPrecipitation: Double, minUV: Int, maxUV: Int) {
        self.ID = UUID()
        self.plantName = plantName
        self.plantType = plantType
        self.minTemperature = minTemperature
        self.maxTemperature = maxTemperature
        self.minHumidity = minHumidity
        self.maxHumidity = maxHumidity
        self.minPrecipitation = minPrecipitation
        self.maxPrecipitation = maxPrecipitation
        self.minUV = minUV
        self.maxUV = maxUV
    }
}
