//
//  UntilledWidget.swift
//  UntilledWidget
//
//  Created by Max on 27/04/26.
//

import WidgetKit
import SwiftUI

struct UntilledEntry: TimelineEntry{
    let date: Date
    let weather: [String]
}

struct UntilledProvider: TimelineProvider{
    
    func placeholder(in context: Context) -> UntilledEntry {
        UntilledEntry(date: Date(), weather: ["PlaceHolder"])
    }
    
    func getSnapshot(in context: Context, completion: @escaping (UntilledEntry) -> Void) {
        let entry = UntilledEntry(date: Date(), weather: ["Snapshot"])
        completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<UntilledEntry>) -> Void) {
        let sharedDefaults = UserDefaults(suiteName: "group.Weather.com.Untilled")
        let weatherStatuses = sharedDefaults?.stringArray(forKey: "weatherStatuses") ?? []
        
        let statuses = weatherStatuses.compactMap { $0 }
        
        let entry = UntilledEntry(date: Date(), weather: statuses)
        let timeline = Timeline(entries: [entry], policy: .after(Date().addingTimeInterval(3600)))
        completion(timeline)
    }
}

struct UntilledWidgetEntryView: View {
    var entry: UntilledProvider.Entry
    
    @ViewBuilder
    var body: some View{
        let weatherSet = Set(entry.weather)
        let content = VStack (spacing: 30){
            Image("Rose")
                .frame(width: 50, height: 50)
            HStack(alignment: .bottom, spacing: 15){
                Image(systemName: "thermometer.sun.fill")
                    .foregroundStyle(
                        weatherSet.contains("hot") ? .red :
                            weatherSet.contains("cold") ? .blue :
                                .gray
                    )
                Image(systemName: "humidity.fill")
                    .foregroundStyle(
                        weatherSet.contains("humid") ? .red :
                            weatherSet.contains("dry") ? .blue :
                                .gray
                    )
                Image(systemName: "cloud.rain")
                    .foregroundStyle(
                        weatherSet.contains("rainy") ? .red :
                            weatherSet.contains("sunny") ? .blue :
                                .gray
                    )
                Image(systemName: "sun.max")
                    .foregroundStyle(
                        weatherSet.contains("uvhigh") ? .red :
                            weatherSet.contains("uvlow") ? .blue :
                                .gray
                    )
            }
        }
        if #available(iOS 17.0, *){
            content.containerBackground(for: .widget){
                Color(.green).opacity(0.18)
            }
        }
        else {
            content.containerBackground(for: .widget){
                Color.clear
            }
        }
    }
}

struct UntilledWidget: Widget{
    let kind: String = "Untilled Widget"
    
    var body: some WidgetConfiguration{
        StaticConfiguration(kind: kind, provider: UntilledProvider()) { entry in
        let base = UntilledWidgetEntryView(entry: entry)
            if #available(iOS 17.0, *){
                base.containerBackground(for: .widget){
                    Color(.green).opacity(0.18)
                }
            }
            else {
                base.containerBackground(for: .widget){
                    Color.clear
                }
            }
        }
        .configurationDisplayName("Untilled Widget")
        .description("In case of any extreme weather.")
    }
}
