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
        GeometryReader { proxy in
            ScrollView{
                VStack(spacing:20){
                    
                    VStack(spacing: 10) {
                        Text("MY PLANT")
                            .font(.system(size: 18, weight: .light))
                        Text(plant.plantName)
                            .font(.system(size: 38, weight: .regular))
                        Text("Chance of a Dry Leave Edges")
                            .font(.system(size: 20, weight: .regular))
                    }
                    .padding(.vertical, 20)
                    Spacer()
                    ZStack{
                        MoundShape()
                                .fill(Color.black)
                                .frame(height: 500)
                                .ignoresSafeArea(edges: .bottom)
                        ZStack{
                            Image(plant.plantType)
                                .resizable()
                                .scaledToFit()
                                .frame(height:150)
                                .offset(y:-280)
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
                                    Text("30º")
                                        .font(.system(size: 40, weight: .bold))
                                    Text("Optimal: \(plant.minTemperature, specifier: "%.f")º - \(plant.maxTemperature, specifier: "%.f")º")
                                        .font(.system(size: 15, weight:.regular))
                                        .italic()
                                }
                            }
                            HStack{
                                Image(systemName: "humidity.fill")
                                    .font(.system(size: 20, weight: .bold))
                                VStack(alignment: .leading){
                                    Text("69%")
                                        .font(.system(size: 40, weight: .bold))
                                    Text("Optimal: \(plant.minHumidity, specifier: "%.f")% - \(plant.maxHumidity, specifier: "%.f")%")
                                        .font(.system(size: 15, weight:.regular))
                                        .italic()
                                }
                            }
                            HStack{
                                Image(systemName: "cloud.rain")
                                    .font(.system(size: 20, weight: .bold))
                                VStack(alignment: .leading){
                                    Text("0mm")
                                        .font(.system(size: 40, weight: .bold))
                                    Text("Optimal: \(plant.minPrecipitation, specifier: "%.f")mm - \(plant.maxPrecipitation, specifier: "%.f")mm")
                                        .font(.system(size: 15, weight:.regular))
                                        .italic()
                                }
                            }
                            HStack{
                                Image(systemName: "sun.max")
                                    .font(.system(size: 20, weight: .bold))
                                VStack(alignment: .leading){
                                    Text("6 UV")
                                        .font(.system(size: 40, weight: .bold))
                                    Text("Optimal: \(plant.minUV, specifier: "%.f") UV - \(plant.maxUV, specifier: "%.f") UV")
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
