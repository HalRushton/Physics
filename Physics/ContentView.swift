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
            VStack {
                NavigationLink(destination: {
                    ConfettiMenu()
                }, label: {
                    Text("Confetti")
                }).buttonStyle(.borderedProminent)
                    .padding()
                NavigationLink(destination: {
                    AnimationView()
                }, label: {
                    Text("Animation View")
                }).buttonStyle(.borderedProminent)
                    .padding()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
