//
//  FlowerData.swift
//  Untilled
//
//  Created by Max on 17/04/26.
//

import SwiftData
import Foundation

struct PlantData: Hashable{
    let id = UUID()
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
}
