//
//  DetailSheet.swift
//  Untilled
//
//  Created by Andhika Satria on 20/04/26.
//

import SwiftUI
import Lottie

struct DetailSheet: View {
    var body: some View {
        LottieView(animation: .named("plant"))
            .playing()
            .looping() 
            .resizable()
            .frame(width: 300, height: 300)
    }
}

#Preview {
    DetailSheet()
}
