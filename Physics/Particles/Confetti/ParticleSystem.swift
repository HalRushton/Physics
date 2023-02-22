//
//  ParticleSystem.swift
//  flagEmojiQuiz
//
//  Created by Hal Rushton on 1/25/23.
//

import SwiftUI

class ParticleSystem {
    let image = Image("Magenta")
    var particles = [Particle]()
    var center = UnitPoint.center
    
    func newConfettiParticle(x: Double, y: Double, left: Bool) {
        let newParticle = Particle.newConfettiParticle(x: x, y: y, left: left)
        particles.append(newParticle)
    }
    
    func update(date: TimeInterval) -> Bool {
        particles = particles.filter { $0.shouldErase == false }
        
        particles.forEach { particle in
            particle.updateConfettiParticle(date: date)
        }
        return true
    }
}
