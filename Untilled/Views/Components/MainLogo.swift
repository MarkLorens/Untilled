//
//  MainLogo.swift
//  Untilled
//
//  Created by Ryan Tjendana on 17/04/26.
//
import SwiftUI

struct MainLogo: View {
    var body: some View {
        HStack{
            Image("Logo")
                .resizable()
                .scaledToFit()
                .frame(width: 35, height: 35)
                .padding(.leading)
            Text("Untillted").bold().font(.title)
        }
    }
}

#Preview {
    MainLogo()
}
