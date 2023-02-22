//
//  ConfettiViewModel.swift
//  flagEmojiQuiz
//
//  Created by Hal Rushton on 1/25/23.
//

import SwiftUI

class ConfettiViewModel: ObservableObject {
    @Published var particleSystem = ParticleSystem()
    init() {
        for _ in 1...150  { particleSystem.newConfettiParticle(x: 0, y: 0.5, left: true) }
        for _ in 1...150  { particleSystem.newConfettiParticle(x: 1, y: 0.5, left: false) }
    }
}
