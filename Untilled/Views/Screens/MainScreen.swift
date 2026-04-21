//
//  ContentView.swift
//  Untilled
//
//  Created by Max on 17/04/26.
//

import SwiftUI

struct MainScreen: View {
    @State var isShowed: Bool = false
    @State var mainPlantDatas = [PlantData](plantDatas)
    
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    @State private var weather: WeatherData?
    struct PlantWeatherData: Hashable{
        var plantData : PlantData
        var weatherData : WeatherData?
    }
    var body: some View {
        NavigationStack{
            ScrollView(.vertical, showsIndicators: false){
                VStack(alignment: .leading){
                    MainLogo()

                    if let weather {
                        WeatherOverviewCard(data: weather)
                    } else {
                        ProgressView()
                            .padding()
                    }
                    HStack{
                        Text("My Plants")
                            .font(.title3.bold())
                        Spacer()
                        Button(action: {
                            isShowed = true
                        }) {
                            Image(systemName: "plus")
                                .font(.headline.weight(.semibold))
                                .padding(7)
                                .background(Circle().fill(.green))
                                .foregroundColor(.white)
                        }
                        .navigationDestination(isPresented: $isShowed){
                            AddPlantScreen(isPresented: $isShowed, updatedPlantData: $mainPlantDatas)
                        }
                    }
                    .padding()
                    LazyVGrid(columns: columns, spacing: 20){
                        ForEach(mainPlantDatas, id: \.id){ plantData in
                            let data = PlantWeatherData(plantData: plantData, weatherData: weather)
                            NavigationLink(value: data) {
                                PlantCard(plantData: data.plantData)
                            }
                        }
                    }
                }
            }
            .navigationDestination(for: PlantWeatherData.self) { data in
                PlantDetail(plant: data.plantData, weather: data.weatherData)
            }
        }
        
        .task {
            await loadWeather()
        }
    }
}

extension MainScreen {
    func loadWeather() async {
        do {
            let result = try await fetchWeather()
            self.weather = result
        } catch {
            print("Failed to fetch weather:", error)
        }
    }
}

#Preview {
    MainScreen()
}
