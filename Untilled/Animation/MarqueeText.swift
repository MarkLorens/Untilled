//
//  MarqueeText.swift
//  Untilled
//
//  Created by Max on 23/04/26.
//

import SwiftUI

struct MarqueeText: View {
    let text: String
    var duration: Double = 15.0
    var delay: Double = 1.0
    var threshold: Int = 8
    
    @State private var textSize: CGSize = .zero
    @State private var animate: Bool = false
    
    var body: some View {
        GeometryReader { geo in
            let containerWidth = geo.size.width
    
            if (text.count > threshold){
                ZStack{
                    HStack(spacing: 30){
                        Text(text)
                            .background(
                                GeometryReader { textGeo in
                                    Color.clear
                                        .onAppear{
                                            textSize = textGeo.size
                                            animate = true
                                        }
                                }
                            )
                            .fixedSize()
                        
                        Text(text)
                            .fixedSize()
                    }
                    .offset(x: animate ? -textSize.width - 30 : 0)
                    .animation(
                        animate
                        ? Animation.linear(duration: duration)
                            .delay(delay)
                            .repeatForever(autoreverses: false)
                        : .default, value: animate
                    )
                }
                .frame(width: containerWidth, alignment: .leading)
                .clipped()
            } else {
                Text(text)
                    .lineLimit(1)
                    .truncationMode(.tail)
                    .frame(width: containerWidth, alignment: .leading)
            }
        }
        .frame(height: 50)
    }
}
