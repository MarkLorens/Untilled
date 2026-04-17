//
//  WeatherData.swift
//  Untilled
//
//  Created by Max on 17/04/26.
//

import SwiftData

@Model
class WeatherData{
    var temperature: Double
    var humidity: Double
    var precipitation: Double
    var UV: Int
    
    init(temperature: Double, humidity: Double, precipitation: Double, UV: Int) {
        self.temperature = temperature
        self.humidity = humidity
        self.precipitation = precipitation
        self.UV = UV
    }
}
