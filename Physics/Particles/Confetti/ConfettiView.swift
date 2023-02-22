//
//  ConfettiView.swift
//  flagEmojiQuiz
//
//  Created by Hal Rushton on 1/25/23.
//

import SwiftUI

struct ConfettiView: View {
    @ObservedObject var viewModel: ConfettiViewModel
    let coordinator: ConfettiViewCoordinator
    
    var body: some View {
        GeometryReader { geometry in
            TimelineView(.animation) { timeline in
                if viewModel.particleSystem.update(date: timeline.date.timeIntervalSinceReferenceDate) {
                    ZStack {
                        ForEach(viewModel.particleSystem.particles, id: \.self) { particle in
                            particle.image
                                .rotationEffect(Angle(radians: particle.rotation * Double.pi * 2))
                                .position(x: particle.x * geometry.size.width, y: particle.y * geometry.size.height)
                                .opacity(particle.opacity)
                                
                        }
                    }
                }
            }
        }
    }
}
