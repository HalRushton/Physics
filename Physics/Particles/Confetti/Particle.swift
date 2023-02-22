//
//  Particle.swift
//  flagEmojiQuiz
//
//  Created by Hal Rushton on 1/25/23.
//

import SwiftUI

class Particle: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(uuid)
    }
    static func == (lhs: Particle, rhs: Particle) -> Bool {
        return lhs.uuid == rhs.uuid
    }
    let uuid: String
    var x: Double
    var y: Double
    var opacity: Double = 1
    var xVelocity: Double
    var yVelocity: Double
    var rotation: Double
    var rotationVelocity: Double
    let rotationAcceleration: Double
    let yAcceleration: Double
    let fadeTime: TimeInterval
    let eraseTime: TimeInterval
    let image: Image
    var shouldErase: Bool = false
    
    init(uuid: String, x: Double, y: Double, opacity: Double = 1, xVelocity: Double, yVelocity: Double, rotation: Double, rotationVelocity: Double, rotationAcceleration: Double, yAcceleration: Double, fadeTime: TimeInterval, eraseTime: TimeInterval, image: Image, shouldErase: Bool = false) {
        self.uuid = uuid
        self.x = x
        self.y = y
        self.opacity = opacity
        self.xVelocity = xVelocity
        self.yVelocity = yVelocity
        self.rotation = rotation
        self.rotationVelocity = rotationVelocity
        self.rotationAcceleration = rotationAcceleration
        self.yAcceleration = yAcceleration
        self.fadeTime = fadeTime
        self.eraseTime = eraseTime
        self.image = image
        self.shouldErase = shouldErase
    }
    
    static var nextColor = 0
}
