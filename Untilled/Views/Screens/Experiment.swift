//
//  DetailSheet.swift
//  Untilled
//
//  Created by Andhika Satria on 20/04/26.
//

import SwiftUI
import Lottie

struct Experiment: View {
    var body: some View {
        LottieView(animation: .named("HealthyGrapeAnimation"))
            .playing()
            .looping()
            .resizable()
            .frame(width: 300, height: 300)
    }
}

struct GradientSliderView: View {
    @State private var value: Double = 0.5
    
    var body: some View {
        ZStack {
            // The background gradient track
            LinearGradient(
                gradient: Gradient(colors: [.blue, .purple, .red]),
                startPoint: .leading,
                endPoint: .trailing
            )
            .frame(height: 6)
            .cornerRadius(3)
            
            // The actual slider on top
            Slider(value: $value)
                .accentColor(.clear) // Hides the default track color
        }
        .padding()
    }
}

#Preview {
    Experiment()
}
