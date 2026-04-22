//
//  FlowerDetail.swift
//  Untilled
//
//  Created by Max on 19/04/26.
//

import SwiftUI
import Lottie

struct PlantDetail: View {
    let plant: PlantData
    let weather: WeatherData?
    var dangerUp: Color = .red
    var dangerDown: Color = .blue
    
    var plantStatus: [String] = [
        "Chance of dry leave edges.",
        "High—watch for mold or mildew.",
        "Heavy moisture, look out for soggy roots.",
        "UV might cause fade in colors."
    ]
    
    var body: some View{
        GeometryReader { proxy in
            VStack{
                VStack(spacing:20){
                    
                    VStack(spacing: 10) {
                        Text("MY PLANT")
                            .font(.system(size: 18, weight: .light))
                        Text(plant.plantName)
                            .font(.system(size: 38, weight: .regular))
                        if weather?.temperature ?? 0 > plant.maxTemperature {
                            Text(plantStatus[0])
                                .font(.system(size: 20, weight: .regular))
                        }
                        else if weather?.humidity ?? 0 > plant.maxHumidity {
                            Text(plantStatus[1])
                                .font(.system(size: 20, weight: .regular))
                        }
                        else if weather?.precipitation ?? 0 > plant.maxPrecipitation {
                            Text(plantStatus[2])
                                .font(.system(size: 20, weight: .regular))
                        }
                        else if Int(weather!.uv) > plant.maxUV{
                            Text(plantStatus[3])
                                .font(.system(size: 20, weight: .regular))
                        }
                        else{
                            Text("All sunshine and rainbow here!")
                                .font(.system(size: 20, weight: .regular))
                        }
                    }
                    .padding(.vertical, 20)
                    Spacer()
                    ZStack{
                        MoundShape()
                                .fill(Color.black)
                                .frame(height: 500)
                                .ignoresSafeArea(edges: .bottom)
                        ZStack{
                            if let dataAsset = NSDataAsset(name: "\(plant.plantType)Animation"),
                               let animation = try? LottieAnimation.from(data: dataAsset.data) {

                                LottieView(animation: animation)
                                    .playing()
                                    .resizable()
                                    .frame(width: 200, height: 200)
                                    .offset(y: -280)

                            } else {
                                Image("\(plant.plantType)")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 200, height: 200)
                                    .offset(y: -280)
                            }
                            
                            Image(systemName: "sun.max.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(height:100)
                                .offset(x:100, y:-370)
                                .foregroundStyle(.yellow)
                        }

                        VStack(alignment: .leading, spacing: 20){
                            HStack{
                                Image(systemName: "thermometer.sun.fill")
                                    .font(.system(size: 20, weight: .bold))
                                VStack(alignment: .leading){
                                    Text("\(weather?.temperature ?? 0, specifier: "%.1f")º")
                                        .font(.system(size: 40, weight: .bold))
                                        .foregroundStyle(
                                            weather?.temperature ?? 0 > plant.maxTemperature
                                            ? dangerUp
                                            : (weather?.temperature ?? 0 < plant.minTemperature
                                                ? dangerDown
                                                : .white)
                                        )
                                    Text("Optimal: \(plant.minTemperature, specifier: "%.f")º - \(plant.maxTemperature, specifier: "%.f")º")
                                        .font(.system(size: 15, weight:.regular))
                                        .italic()
                                }
                            }
                            HStack{
                                Image(systemName: "humidity.fill")
                                    .font(.system(size: 20, weight: .bold))
                                VStack(alignment: .leading){
                                    Text("\(weather?.humidity ?? 0, specifier: "%.1f")%")
                                        .font(.system(size: 40, weight: .bold))
                                        .foregroundStyle(
                                            weather?.humidity ?? 0 > plant.maxHumidity
                                            ? dangerUp
                                            : (weather?.humidity ?? 0 < plant.minHumidity
                                                ? dangerDown
                                                : .white)
                                        )
                                    Text("Optimal: \(plant.minHumidity, specifier: "%.f")% - \(plant.maxHumidity, specifier: "%.f")%")
                                        .font(.system(size: 15, weight:.regular))
                                        .italic()
                                }
                            }
                            HStack{
                                Image(systemName: "cloud.rain")
                                    .font(.system(size: 20, weight: .bold))
                                VStack(alignment: .leading){
                                    Text("\(weather?.precipitation ?? 0, specifier: "%.1f")mm")
                                        .font(.system(size: 40, weight: .bold))
                                        .foregroundStyle(
                                            weather?.precipitation ?? 0 > plant.maxPrecipitation
                                            ? dangerUp
                                            : (weather?.precipitation ?? 0 < plant.minPrecipitation
                                                ? dangerDown
                                                : .white)
                                        )
                                    Text("Optimal: \(plant.minPrecipitation, specifier: "%.f")mm - \(plant.maxPrecipitation, specifier: "%.f")mm")
                                        .font(.system(size: 15, weight:.regular))
                                        .italic()
                                }
                            }
                            HStack{
                                Image(systemName: "sun.max")
                                    .font(.system(size: 20, weight: .bold))
                                VStack(alignment: .leading){
                                    Text("\(weather?.uv ?? 0, specifier: "%.f")UV")
                                        .font(.system(size: 40, weight: .bold))
                                        .foregroundStyle(
                                            Int(weather!.uv) > plant.maxUV
                                            ? dangerUp
                                            : (Int(weather!.uv) < plant.minUV
                                                ? dangerDown
                                                : .white)
                                        )
                                    Text("Optimal: \(plant.minUV) UV - \(plant.maxUV) UV")
                                        .font(.system(size: 15, weight:.regular))
                                        .italic()
                                }
                            }
                        }
                        .padding()
                        .frame(maxWidth: .infinity, minHeight: proxy.size.height ,alignment: .leading)
                        .foregroundStyle(.white)
                    }
                }
            }
            .navigationTitle(plant.plantName)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .topBarTrailing){
                    Button(role: .destructive) {
                        print ("Delete \(plant.plantName)")
                    } label:{
                        Image(systemName: "trash.fill")
                            .foregroundStyle(.red)
                    }
                }
            }
        }
    }
}

#Preview {
    let wData = WeatherData(temperature: 28, humidity: 70.1, precipitation: 20.0, uv: 5)
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
        ), weather: wData
    )

}
