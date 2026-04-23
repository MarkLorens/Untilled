//
//  LoadingScreen.swift
//  Untilled
//
//  Created by Max on 21/04/26.
//
import SwiftUI
import Lottie

struct LoadingScreen: View {
    var body: some View{
        LottieView(animation: .named("loading"))
            .animationSpeed(0.5)
            .playing()
            .looping()
            .resizable()
            .ignoresSafeArea()
    }
}

#Preview {
    LoadingScreen()
}
