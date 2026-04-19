//
//  WeatherData.swift
//  Untilled
//
//  Created by Max on 17/04/26.
//
import SwiftData
import Foundation

@Model
class WeatherData{
    var temperature: Double
    var humidity: Double
    var precipitation: Double
    var uv: Double
    
    init(temperature: Double, humidity: Double, precipitation: Double, uv: Double) {
        self.temperature = temperature
        self.humidity = humidity
        self.precipitation = precipitation
        self.uv = uv
    }
}
