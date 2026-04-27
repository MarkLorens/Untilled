//
//  AddPlantScreen.swift
//  Untilled
//
//  Created by Ryan Tjendana on 20/04/26.
//

import Foundation
import SwiftUI

struct AddPlantScreen: View {
    @Binding var isPresented: Bool
    @Binding var updatedPlantData: [PlantData]
    
    var plantImages: [String] = ["Cactus", "Fruity", "Grape", "Jasmine", "Leaves", "Orchid", "Rose", "Sunflower", "Tulip"]
    
    @State private var plantName: String = ""
    @State private var selectedImage: String = ""
    @State private var minTemp: Double = 10
    @State private var maxTemp: Double = 30
    @State private var minHumid: Double = 0
    @State private var maxHumid: Double = 50
    @State private var minPrec: Double = 0
    @State private var maxPrec: Double = 2
    @State private var minUv: Double = 0
    @State private var maxUv: Double = 5
    
    @State var plantObject : PlantData = PlantData(plantName: "", plantType: "", minTemperature: 0.0, maxTemperature: 0.0, minHumidity: 0.0, maxHumidity: 0.0, minPrecipitation: 0.0, maxPrecipitation: 0.0, minUV: 0, maxUV: 0)
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                Text("Overview")
                    .padding(.horizontal)
                    .bold()
                VStack(alignment: .leading){
                    HStack(alignment: .top){
                        Text("Name:")
                        TextField("Plant Name", text: $plantName)
                    }
                    Divider()
                    VStack(alignment: .leading){
                        Text("Type:").padding(.vertical, 5)
                        ZStack{
                            ScrollView(.horizontal, showsIndicators: false){
                                HStack(spacing: 20){
                                    ForEach(plantImages, id: \.self) { image in
                                        VStack{
                                            Image(image)
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 100, height: 100)
                                            if(selectedImage == image){
                                                Capsule()
                                                    .frame(width: 80, height: 5)
                                                    .foregroundColor(.blue)
                                            }
                                        }.onTapGesture {
                                            selectedImage = image
                                        }
                                    }
                                }
                            }
                            Image(systemName:"arrow.right.circle.fill")
                                .resizable()
                                .foregroundStyle(.blue)
                                .frame(width: 30, height: 30)
                                .offset(x:155)
                                .opacity(1)
                        }
                    }
                }
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 2)
                
                Text("Ideal Conditions")
                    .padding(.horizontal)
                    .padding(.top)
                    .bold()
                
                VStack(alignment: .leading){
                    HStack(alignment: .center){
                        Text("Temperature")
                            .frame(width: 100, height: .infinity, alignment: .leading)
                        
                        VStack {
                            HStack{
                                Slider(value: $minTemp, in: -10...50, step: 1)
                                Text("\(Int(minTemp))° (Min)")
                            }
                            HStack{
                                Slider(value: $maxTemp, in: -10...50, step: 1)
                                Text("\(Int(maxTemp))° (Max)")
                            }
                        }
                        .onChange(of: minTemp) {
                            if minTemp > maxTemp { minTemp = maxTemp }
                        }
                        .onChange(of: maxTemp) {
                            if maxTemp < minTemp { maxTemp = minTemp }
                        }
                    }
                    Divider()
                    HStack(alignment: .center){
                        Text("Humidity")
                            .frame(width: 100, height: .infinity, alignment: .leading)
                        VStack {
                            HStack{
                                Slider(value: $minHumid, in: 0...100, step: 1)
                                Text("\(Int(minHumid))% (Min)")
                            }
                            HStack{
                                Slider(value: $maxHumid, in: -0...100, step: 1)
                                Text("\(Int(maxHumid))% (Max)")
                            }
                        }
                        .onChange(of: minHumid) {
                            if minHumid > maxHumid { minHumid = maxHumid }
                        }
                        .onChange(of: maxHumid) {
                            if maxHumid < minHumid { maxHumid = minHumid }
                        }
                    }
                    Divider()
                    HStack(alignment: .center){
                        Text("Precipitation")
                            .frame(width: 100, height: .infinity, alignment: .leading)
                        VStack {
                            HStack{
                                Slider(value: $minPrec, in: 0...20, step: 1)
                                Text("\(Int(minPrec))mm (Min)")
                            }
                            HStack{
                                Slider(value: $maxPrec, in: -0...20, step: 1)
                                Text("\(Int(maxPrec))mm (Max)")
                            }
                        }
                        .onChange(of: minPrec) {
                            if minPrec > maxPrec { minPrec = maxPrec }
                        }
                        .onChange(of: maxPrec) {
                            if maxPrec < minPrec { maxPrec = minPrec }
                        }
                        
                    }
                    Divider()
                    HStack(alignment: .center){
                        Text("UV Index")
                            .frame(width: 100, height: .infinity, alignment: .leading)
                        VStack {
                            HStack{
                                Slider(value: $minUv, in: 0...11, step: 1)
                                Text("\(Int(minUv))UV (Min)")
                            }
                            HStack{
                                Slider(value: $maxUv, in: -0...11, step: 1)
                                Text("\(Int(maxUv))UV (Max)")
                            }
                        }
                        .onChange(of: minUv) {
                            if minUv > maxUv { minUv = maxUv }
                        }
                        .onChange(of: maxUv) {
                            if maxUv < minUv { maxUv = minUv }
                        }
                    }
                }
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 2)
            }
            .padding()
            
            Button(action: {
                plantObject.plantName = plantName
                plantObject.plantType = selectedImage
                plantObject.maxHumidity = maxHumid
                plantObject.minHumidity = minHumid
                plantObject.maxTemperature = maxTemp
                plantObject.minTemperature = minTemp
                plantObject.maxPrecipitation = maxPrec
                plantObject.minPrecipitation = minPrec
                plantObject.maxUV = Int(maxUv)
                plantObject.minUV = Int(minUv)
                
                addPlant(plant: plantObject)
                
                updatedPlantData = plantDatas
                
                print("UV Max : \(maxUv)")
                print("UV Min: \(minUv)")
                
//                print("Add Plant Successfull with:")
//                print("\(plantObject)")
                
                //print("plant datas:\n \(plantDatas)")
                isPresented = false
                
            }){
                Text("Add Plant")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .init(horizontal: .center, vertical: .center))
                    .glassEffect(.regular.tint(.green.opacity(1)).interactive(), in: .rect(cornerRadius: 5.0))
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    @Previewable @State var isPresented: Bool = true
    @Previewable @State var plantDatas: [PlantData] = []
    AddPlantScreen(isPresented: $isPresented, updatedPlantData: $plantDatas)
}
