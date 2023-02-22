//
//  Particle+Confetti.swift
//  Physics
//
//  Created by Hal Rushton on 2/22/23.
//

import Foundation
import SwiftUI

extension Particle {
    
    static func newConfettiParticle(x: Double, y: Double, left: Bool) -> Particle {
        let image: Image
        switch Self.nextColor {
        case 0:
            image = Image("Cyan")
            Self.nextColor = 1
        case 1:
            image = Image("Yellow")
            Self.nextColor = 2
        default:
            image = Image("Magenta")
            Self.nextColor = 0
        }
        let now = Date().timeIntervalSinceReferenceDate
        
        // Angle is calculated in radians, where a full circle is 2pi
        // And just sets a random range for the trajectory
        // The angle and velocity are converted x and y components.
        let angle = Double.random(in: -Double.pi / 4 ..< -Double.pi/16)
        let velocity = Double.random(in: 0.003..<0.018)
        var xVelocity = velocity * cos(angle)
        let yVelocity = velocity * sin(angle)
        if !left {
            xVelocity = -xVelocity
        }
        return Particle(uuid: UUID().uuidString, x: x, y: y, xVelocity: xVelocity, yVelocity: yVelocity, rotation: Double.random(in: 0..<1), rotationVelocity: Double.random(in: -0.14..<0.14), rotationAcceleration: 0, yAcceleration: -0.00005, fadeTime: now + 1, eraseTime: now + 1.5, image: image)
    }
    
    static let totalFadeTime: Double = 0.5
    
    /**
     Standard equation for motion over time.
        Position is a function of velocity and accleration over time.
        Each position could be calculated based on a starting point and
        a delta time.
            p = p' + vt + ½at²
     
     However, there is a simpler way:
     
        In real time we need to update the position and velocity each cycle
     
        In each cycle, we add the velocity.
            position = position + velocity
     
        Then also in each cycle we need to add the accleration to the velocity
            velocity = velocity + acceleration
     
        It also helps to simulate some "drag" to slow the motion over time.  In each cycle:
            velocity = velocity x dragCoefficient
     
    Velocity, acceleration, and drag can all operate on rotation as well.
     
     */
    
    func updateConfettiParticle(date: TimeInterval
    ) {
        x = x + xVelocity
        y = y + yVelocity
        // TODO Uncomment to add some rotation
//        rotation += rotationVelocity.truncatingRemainder(dividingBy: 1)
        
        // TODO Uncomment to fade out the particles
//        if eraseTime <= date {
//            shouldErase = true
//            return
//        }
//        var fadingTime: Double = 0
//        if fadeTime <= date {
//            fadingTime = date - fadeTime
//        }
//
//        if fadingTime > 0 {
//            opacity = 1 - fadingTime / Self.totalFadeTime
//        }


        // TODO Uncomment to add some gravity
//        yVelocity -= yAcceleration
        // TODO Uncomment to add some drag
//        yVelocity *= 0.98
//        rotationVelocity *= 0.98
//        xVelocity *= 0.98
    }
    
    // Left in for demonstration purposes
    static func newBoxyConfettiParticle(x: Double, y: Double, left: Bool) -> Particle {
        let image: Image
        switch Self.nextColor {
        case 0:
            image = Image("Cyan")
            Self.nextColor = 1
        case 1:
            image = Image("Yellow")
            Self.nextColor = 2
        default:
            image = Image("Magenta")
            Self.nextColor = 0
        }
        let now = Date().timeIntervalSinceReferenceDate
        let xVelocity: Double
        let yVelocity = Double.random(in: -0.01 ..< 0.01)
        if left {
            xVelocity = Double.random(in: 0.003..<0.015)
        } else {
            xVelocity = Double.random(in: -0.015 ..< -0.0015)
        }
        return Particle(uuid: UUID().uuidString, x: x, y: y, xVelocity: xVelocity, yVelocity: yVelocity, rotation: Double.random(in: 0..<1), rotationVelocity: Double.random(in: -0.15..<0.15), rotationAcceleration: 0, yAcceleration: -0.0000005, fadeTime: now + 1, eraseTime: now + 1.5, image: image)
    }
    
}
