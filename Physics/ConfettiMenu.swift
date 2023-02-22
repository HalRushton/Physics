//
//  ConfettiMenu.swift
//  Physics
//
//  Created by Hal Rushton on 2/21/23.
//

import SwiftUI

struct ConfettiMenu: View {
    @State var showConfetti: Bool = false
    var body: some View {
        ZStack {
            Rectangle()
                .fill(LinearGradient(gradient: Gradient(colors: [Color.white, Color.backgroundy]), startPoint: .topLeading, endPoint: .bottom))
                .ignoresSafeArea()
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("Hello, world!").padding()
                Button(action: {
                    showConfetti = !showConfetti
                }, label: {
                    Text(showConfetti ? "Hide confetti" : "Show confetti")
                }).buttonStyle(.borderedProminent)
                .padding()
            }
            if showConfetti {
                ConfettiViewCoordinator(viewModel: ConfettiViewModel()).start()
            }
        }
    }
}

struct ConfettiMenu_Previews: PreviewProvider {
    static var previews: some View {
        ConfettiMenu()
    }
}
