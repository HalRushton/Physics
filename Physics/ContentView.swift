//
//  ContentView.swift
//  Physics
//
//  Created by Hal Rushton on 2/21/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Rectangle()
                    .fill(LinearGradient(gradient: Gradient(colors: [Color.backgroundy, Color.brown]), startPoint: .topLeading, endPoint: .bottom)).ignoresSafeArea()
                VStack {
                    NavigationLink(destination: {
                        AnimationView()
                    }, label: {
                        Text("Animation View")
                    }).buttonStyle(.borderedProminent)
                        .padding()
                    NavigationLink(destination: {
                        ConfettiMenu()
                    }, label: {
                        Text("Confetti")
                    }).buttonStyle(.borderedProminent)
                        .padding()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
