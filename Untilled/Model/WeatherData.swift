//
//  WeatherData.swift
//  Untilled
//
//  Created by Max on 17/04/26.
//
import SwiftData
import Foundation

struct OpenMeteoResponse: Decodable {
    struct Current: Decodable {
        let temperature_2m: Double
        let relative_humidity_2m: Double
        let precipitation: Double
        let uv_index: Double
    }
    
    let current: Current
}

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

extension WeatherData {
    static func from(response: OpenMeteoResponse) -> WeatherData {
        return WeatherData(
            temperature: response.current.temperature_2m,
            humidity: response.current.relative_humidity_2m,
            precipitation: response.current.precipitation,
            uv: response.current.uv_index
        )
    }
}

// Open-Meteo Fetch

func fetchWeather() async throws -> WeatherData {
    let urlString = """
    https://api.open-meteo.com/v1/forecast?latitude=-8.65&longitude=115.22&current=temperature_2m,relative_humidity_2m,precipitation,uv_index
    """
    
    guard let url = URL(string: urlString) else {
        throw URLError(.badURL)
    }

    let (data, _) = try await URLSession.shared.data(from: url)
    
    let decoded = try JSONDecoder().decode(OpenMeteoResponse.self, from: data)
    
    return WeatherData.from(response: decoded)
}
