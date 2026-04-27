//
//  ContentView.swift
//  Untilled
//
//  Created by Max on 17/04/26.
//

import SwiftUI
import WidgetKit

struct MainScreen: View {
    @State var isShowed: Bool = false
    @State var mainPlantDatas = [PlantData](plantDatas)
    
    
    // Loading Screen
    @State var isHomeRootScreen = false
    @State var scaleAmount: CGFloat = 1
    
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
            ZStack{
                if isHomeRootScreen{
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
                                        PlantCard(plantData: data.plantData, weatherData: data.weatherData!)
                                    }
                                }
                            }
                            .padding()
                        }
                    }
                    .navigationDestination(for: PlantWeatherData.self) { data in
                        PlantDetail(plant: data.plantData, weather: data.weatherData)
                    }
                }
                else{
                    LoadingScreen()
                }
            }
            .animation(.easeInOut(duration: 0.5), value: isHomeRootScreen)
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.5){
                    isHomeRootScreen = true;
                }
            }
            .task {
                await loadWeather()
            }
        }
    }
}

extension MainScreen {
    func loadWeather() async {
        do {
            let result = try await fetchWeather()
            self.weather = result
            
            let weatherStatuses = FetchWeatherStatus(weatherData: weather!)
            
            let rawStatus = weatherStatuses.map { $0 }
            let sharedDefaults = UserDefaults(suiteName: "group.Weather.com.Untilled")
            sharedDefaults?.set(rawStatus, forKey: "weatherStatuses")
            
            WidgetCenter.shared.reloadAllTimelines()
            
        }
        catch {
            print("Failed to fetch weather:", error)
        }
    }
}

#Preview {
    MainScreen()
}
