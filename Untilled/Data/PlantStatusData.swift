//
//  PlantStatusData.swift
//  Untilled
//
//  Created by Max on 22/04/26.
//

import SwiftUI

enum statuses: String, CaseIterable, Hashable {
    case tooHot = "Excess heat may cause dry, crispy leaf edges"
    case tooCold = "Low temperatures can lead to wilting or frost damage"
    case tooHumid = "High humidity increases the risk of mold and mildew"
    case tooDry = "Low humidity may dry out leaves and slow growth"
    case tooRainy = "Excess moisture can lead to soggy roots and rot"
    case tooSunny = "Intense sunlight may scorch or bleach the leaves"
    case highUV = "Strong UV exposure can fade colors and damage foliage"
    case lowUV = "Low light may limit growth and dull leaf color"
    //case fine = "All rainbow and sunshine here!"
}

func FetchPlantStatus(weatherData: WeatherData, plantData: PlantData) -> [statuses]{
    var res: [statuses] = []
    
    if(weatherData.temperature > plantData.maxTemperature){
        res.append(statuses.tooHot)
    }
    else if (weatherData.temperature < plantData.minTemperature){
        res.append(statuses.tooCold)
    }
    
    if(weatherData.humidity > plantData.maxHumidity){
        res.append(statuses.tooHumid)
    }
    else if (weatherData.humidity < plantData.minHumidity){
        res.append(statuses.tooDry)
    }
    
    if(weatherData.precipitation > plantData.maxPrecipitation){
        res.append(statuses.tooRainy)
    }
    else if (weatherData.precipitation < plantData.minPrecipitation){
        res.append(statuses.tooSunny)
    }
    
    if(Int(weatherData.uv) > plantData.maxUV){
        res.append(statuses.highUV)
    }
    else if (Int(weatherData.uv) < plantData.minUV){
        res.append(statuses.lowUV)
    }
    
//    if (res.isEmpty){
//        res.append(statuses.fine)
//    }
    
    return res;
}

func FetchWeatherStatus(weatherData: WeatherData) -> [String]{
    var res: [String] = []
    
    if(weatherData.temperature > 30){
        res.append("hot")
    }
    else if (weatherData.temperature < 10){
        res.append("cold")
    }
    
    if(weatherData.humidity > 60){
        res.append("humid")
    }
    else if (weatherData.humidity < 40){
        res.append("dry")
    }
    
    if(weatherData.precipitation > 1){
        res.append("rainy")
    }
    else if (weatherData.precipitation < 15){
        res.append("sunny")
    }
    
    if(Int(weatherData.uv) > 5){
        res.append("uvhigh")
    }
    else if (Int(weatherData.uv) < 1){
        res.append("uvlow")
    }
    
//    if (res.isEmpty){
//        res.append(statuses.fine)
//    }
    
    return res;
}
