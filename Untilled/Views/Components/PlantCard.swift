//
//  PlantCards.swift
//  Untilled
//
//  Created by Ryan Tjendana on 17/04/26.
//

import SwiftUI

struct PlantCard: View {
    let plantData: PlantData
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(plantData.plantName).foregroundColor(.black)
            
            Image(plantData.plantType)
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .padding(.leading)
                .padding(.top)
            
            HStack {
                Circle()
                    .fill(Color.green)
                    .frame(width: 10, height: 10)
                Text("I Liked it :)")
                    .font(.subheadline)
            }
            .padding(.top)
        }
        .padding(5)
        .background(Color.white)
        //.cornerRadius(10)
        //.shadow(radius: 2)
    }
}

#Preview {
    let data = PlantData(plantName: "Monstera", plantType: "Leaves", minTemperature: 20.1, maxTemperature: 25.2, minHumidity: 10.0, maxHumidity: 90.0, minPrecipitation: 0.0, maxPrecipitation: 10.0, minUV: 1, maxUV: 6)
    return PlantCard(plantData: data)
}
