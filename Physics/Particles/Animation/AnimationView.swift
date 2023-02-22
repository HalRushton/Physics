//
//  animationView.swift
//  Physics
//
//  Created by Hal Rushton on 2/21/23.
//

import SwiftUI

class RotationObject {
    var rotation: CGFloat = 0
    var rotationVelocity: CGFloat = 0.015
    var allowRotation: Bool = false
    var unitPoint: UnitPoint = .center
}

struct AnimationView: View {
    var rotationObject = RotationObject()
    var body: some View {
        ZStack {
            Rectangle()
                .fill(LinearGradient(gradient: Gradient(colors: [Color.backgroundy, Color.teal]), startPoint: .topLeading, endPoint: .bottom))
                .ignoresSafeArea()
            TimelineView(.animation) { timeline in
                Text(currentUnitPoint() + " Anchor")
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 80, trailing: 0))
                if updateRotation() {
                    cardView
                    // TODO uncomment this to see impact of offset before rotation
//                        .offset(y: 100)
                        .rotationEffect(Angle(radians: rotationObject.rotation * Double.pi * 2), anchor: rotationObject.unitPoint)
                    // TODO uncomment this to see impact of offset after rotation
//                        .offset(y: 100)
                }
                Button(action: {
                    rotationObject.allowRotation = !rotationObject.allowRotation
                }, label: {
                    Text("Toggle Rotation")
                }).buttonStyle(.borderedProminent)
                    .padding()
                    .padding(EdgeInsets(top: 50, leading: 0, bottom: 0, trailing: 0))
                
                Button(action: {
                    rotationObject.rotation = 0
                }, label: {
                    Text("Reset")
                })
                .buttonStyle(.borderedProminent)
                .padding()
                
                Button(action: {
                    toggleAnchor()
                }, label: {
                    Text("Toggle anchor")
                })
                .buttonStyle(.borderedProminent)
                .padding()
            }
        }
    }

    var cardView: some View {
        HStack {
            Image(systemName: "folder.circle")
            VStack {
                Text("Amy Christyne").font(.title)
                Text("amyC@gmail.com").font(.body)
            }
        }.padding()
            .background(.white)
            .cornerRadius(25)
    }
    
    func updateRotation() -> Bool {
        if rotationObject.allowRotation {
            rotationObject.rotation += rotationObject.rotationVelocity
            if rotationObject.rotation > 1 {
                rotationObject.rotation -= 1
            }
        }
        return true
    }
    
    func toggleAnchor() {
        rotationObject.unitPoint = next(unitPoint: rotationObject.unitPoint)
    }
    
    func next(unitPoint: UnitPoint) -> UnitPoint {
        switch unitPoint {
        case .center:
            return .leading
        case .leading:
            return .topLeading
        case .topLeading:
            return .top
        case .top:
            return .topTrailing
        case .topTrailing:
            return .trailing
        case .trailing:
            return .bottomTrailing
        case .bottomTrailing:
            return .bottom
        case .bottom:
            return .bottomLeading
        case .bottomLeading:
            return .center
        default:
            return .center
        }
    }
    
    func currentUnitPoint() -> String {
        switch rotationObject.unitPoint {
        case .center:
            return "Center"
        case .leading:
            return "Leading"
        case .topLeading:
            return "Top Leading"
        case .top:
            return "Top"
        case .topTrailing:
            return "Top Trailing"
        case .trailing:
            return "Trailing"
        case .bottomTrailing:
            return "Bottom Trailing"
        case .bottom:
            return "Bottom"
        case .bottomLeading:
            return "Bottom Leading"
        default:
            return "default"
        }
    }
}

struct animationView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationView()
    }
}
